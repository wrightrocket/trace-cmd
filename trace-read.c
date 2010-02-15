/*
 * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License (not later!)
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */
#define _LARGEFILE64_SOURCE
#define _GNU_SOURCE
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <stdarg.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <pthread.h>
#include <fcntl.h>
#include <unistd.h>
#include <ctype.h>
#include <errno.h>

#include "trace-local.h"

static unsigned int page_size;
static int input_fd;
const char *input_file = "trace.dat";

static int filter_cpu = -1;

/* Debug variables for testing tracecmd_read_at */
#define TEST_READ_AT 0
#if TEST_READ_AT
#define DO_TEST
static off64_t test_read_at_offset;
static int test_read_at_copy = 100;
static int test_read_at_index;
static void show_test(struct tracecmd_input *handle)
{
	struct pevent *pevent;
	struct record *record;
	struct trace_seq s;
	int cpu;

	if (!test_read_at_offset) {
		printf("\nNO RECORD COPIED\n");
		return;
	}

	pevent = tracecmd_get_pevent(handle);

	record = tracecmd_read_at(handle, test_read_at_offset, &cpu);
	printf("\nHERE'S THE COPY RECORD\n");
	trace_seq_init(&s);
	pevent_print_event(pevent, &s, cpu, record->data, record->size, record->ts);
	trace_seq_do_printf(&s);
	printf("\n");

	free_record(record);
}

static void test_save(struct record *record, int cpu)
{
	if (test_read_at_index++ == test_read_at_copy) {
		test_read_at_offset = record->offset;
		printf("\nUSING THIS RECORD\n");
	}
}
#endif /* TEST_READ_AT */

/* Debug variables for testing tracecmd_set_cpu_at_timestamp */
#define TEST_AT_TIMESTAMP 0
#if TEST_AT_TIMESTAMP
#define DO_TEST
static unsigned long long test_at_timestamp_ts;
static int test_at_timestamp_copy = 100;
static int test_at_timestamp_cpu = -1;
static int test_at_timestamp_index;
static void show_test(struct tracecmd_input *handle)
{
	struct pevent *pevent;
	struct record *record;
	struct trace_seq s;
	int cpu = test_at_timestamp_cpu;

	if (!test_at_timestamp_ts) {
		printf("\nNO RECORD COPIED\n");
		return;
	}

	pevent = tracecmd_get_pevent(handle);

	if (tracecmd_set_cpu_to_timestamp(handle, cpu, test_at_timestamp_ts))
		return;

	record = tracecmd_read_data(handle, cpu);
	printf("\nHERE'S THE COPY RECORD with page %p offset=%p\n",
	       (void *)(record->offset & ~(page_size - 1)),
	       (void *)record->offset);
	trace_seq_init(&s);
	pevent_print_event(pevent, &s, cpu, record->data, record->size, record->ts);
	trace_seq_do_printf(&s);
	printf("\n");

	free_record(record);
}

static void test_save(struct record *record, int cpu)
{
	if (test_at_timestamp_index++ == test_at_timestamp_copy) {
		test_at_timestamp_ts = record->ts;
		test_at_timestamp_cpu = cpu;
		printf("\nUSING THIS RECORD page=%p offset=%p\n",
		       (void *)(record->offset & ~(page_size - 1)),
		       (void *)record->offset);
	}
}
#endif /* TEST_AT_TIMESTAMP */

#define TEST_FIRST_LAST 0
#if TEST_FIRST_LAST
#define DO_TEST
static void show_test(struct tracecmd_input *handle)
{
	struct pevent *pevent;
	struct record *record;
	struct trace_seq s;
	int cpu = 0;

	pevent = tracecmd_get_pevent(handle);

	record = tracecmd_read_cpu_first(handle, cpu);
	if (!record) {
		printf("No first record?\n");
		return;
	}

	printf("\nHERE'S THE FIRST RECORD with offset %p\n",
	       (void *)record->offset);
	trace_seq_init(&s);
	pevent_print_event(pevent, &s, cpu, record->data, record->size, record->ts);
	trace_seq_do_printf(&s);
	printf("\n");

	free_record(record);

	record = tracecmd_read_cpu_last(handle, cpu);
	if (!record) {
		printf("No last record?\n");
		return;
	}

	printf("\nHERE'S THE LAST RECORD with offset %p\n",
	       (void *)record->offset);
	trace_seq_init(&s);
	pevent_print_event(pevent, &s, cpu, record->data, record->size, record->ts);
	trace_seq_do_printf(&s);
	printf("\n");

	free_record(record);
}
static void test_save(struct record *record, int cpu)
{
}
#endif /* TEST_FIRST_LAST */

#ifndef DO_TEST
static void show_test(struct tracecmd_input *handle)
{
}
static void test_save(struct record *record, int cpu)
{
}
#endif

static void show_data(struct tracecmd_input *handle,
		      struct record *record, int cpu)
{
	struct pevent *pevent;
	struct trace_seq s;

	pevent = tracecmd_get_pevent(handle);

	test_save(record, cpu);

	trace_seq_init(&s);
	pevent_print_event(pevent, &s, record);
	trace_seq_do_printf(&s);
	printf("\n");
}

static void read_rest(void)
{
	char buf[BUFSIZ + 1];
	int r;

	do {
		r = read(input_fd, buf, BUFSIZ);
		if (r > 0) {
			buf[r] = 0;
			printf("%s", buf);
		}
	} while (r > 0);
}

static void read_data_info(struct tracecmd_input *handle)
{
	unsigned long long ts;
	struct record *record;
	int cpus;
	int next;
	int cpu;
	int ret;

	ret = tracecmd_init_data(handle);
	if (ret < 0)
		die("failed to init data");

	cpus = tracecmd_cpus(handle);
	printf("cpus=%d\n", cpus);

	/* Latency trace is just all ASCII */
	if (ret > 0) {
		read_rest();
		return;
	}

	do {
		next = -1;
		ts = 0;
		if (filter_cpu >= 0) {
			cpu = filter_cpu;
			record = tracecmd_read_data(handle, cpu);
		} else
			record = tracecmd_read_next_data(handle, &cpu);

		if (record) {
			show_data(handle, record, next);
			free_record(record);
		}
	} while (record);

	show_test(handle);
}

struct tracecmd_input *read_trace_header(void)
{
	input_fd = open(input_file, O_RDONLY);
	if (input_fd < 0)
		die("opening '%s'\n", input_file);

	return tracecmd_alloc_fd(input_fd);
}

void trace_report (int argc, char **argv)
{
	struct tracecmd_input *handle;
	struct pevent *pevent;
	int show_funcs = 0;
	int show_endian = 0;
	int show_page_size = 0;
	int show_printk = 0;
	int latency_format = 0;
	int show_events = 0;
	int print_events = 0;
	int c;

	if (argc < 2)
		usage(argv);

	if (strcmp(argv[1], "report") != 0)
		usage(argv);

	for (;;) {
		int option_index = 0;
		static struct option long_options[] = {
			{"cpu", required_argument, NULL, 0},
			{"events", no_argument, NULL, 0},
			{"help", no_argument, NULL, '?'},
			{NULL, 0, NULL, 0}
		};

		c = getopt_long (argc-1, argv+1, "+hi:fepPlE",
			long_options, &option_index);
		if (c == -1)
			break;
		switch (c) {
		case 'h':
			usage(argv);
			break;
		case 'i':
			input_file = optarg;
			break;
		case 'f':
			show_funcs = 1;
			break;
		case 'P':
			show_printk = 1;
			break;
		case 'e':
			show_endian = 1;
			break;
		case 'p':
			show_page_size = 1;
			break;
		case 'E':
			show_events = 1;
			break;
		case 'l':
			latency_format = 1;
			break;
		case 0:
			switch(option_index) {
			case 0:
				filter_cpu = atoi(optarg);
				break;
			case 1:
				print_events = 1;
				break;
			default:
				usage(argv);
			}
			break;
		default:
			usage(argv);
		}
	}

	handle = read_trace_header();
	if (!handle)
		die("error reading header");

	page_size = tracecmd_page_size(handle);

	if (show_page_size) {
		printf("file page size is %d, and host page size is %d\n",
		       page_size,
		       getpagesize());
		return;
	}

	pevent = tracecmd_get_pevent(handle);

	if (show_endian) {
		printf("file is %s endian and host is %s endian\n",
		       pevent_is_file_bigendian(pevent) ? "big" : "little",
		       pevent_is_host_bigendian(pevent) ? "big" : "little");
		return;
	}

	if (print_events) {
		tracecmd_print_events(handle);
		return;
	}

	if (tracecmd_read_headers(handle) < 0)
		return;

	if (show_funcs) {
		pevent_print_funcs(pevent);
		return;
	}
	if (show_printk) {
		pevent_print_printk(pevent);
		return;
	}

	if (show_events) {
		struct event_format **events;
		struct event_format *event;
		int i;

		events = pevent_list_events(pevent, EVENT_SORT_SYSTEM);
		for (i = 0; events[i]; i++) {
			event = events[i];
			if (event->system)
				printf("%s:", event->system);
			printf("%s\n", event->name);
		}
		return;
	}

	if (latency_format)
		pevent_set_latency_format(pevent, latency_format);

	read_data_info(handle);

	tracecmd_close(handle);

	return;
}
