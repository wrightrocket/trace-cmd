# Install script for directory: /usr/local/src/trace-cmd/kernel-shark/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0"
         RPATH "/usr/local/lib/kernelshark/")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/kernelshark/libkshark.so.1.0.0")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib/kernelshark" TYPE SHARED_LIBRARY FILES "/usr/local/src/trace-cmd/kernel-shark/lib/libkshark.so.1.0.0")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0"
         OLD_RPATH ":::::::::::::::::::::::::::"
         NEW_RPATH "/usr/local/lib/kernelshark/")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark.so.1.0.0")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0"
         RPATH "/usr/local/lib/kernelshark/")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib/kernelshark" TYPE SHARED_LIBRARY FILES "/usr/local/src/trace-cmd/kernel-shark/lib/libkshark-plot.so.1.0.0")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0"
         OLD_RPATH "/usr/local/src/trace-cmd/kernel-shark/lib:"
         NEW_RPATH "/usr/local/lib/kernelshark/")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-plot.so.1.0.0")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/kernelshark" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/kernelshark")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/kernelshark"
         RPATH "/usr/local/lib/kernelshark/")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/kernelshark")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/usr/local/src/trace-cmd/kernel-shark/bin/kernelshark")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/kernelshark" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/kernelshark")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/kernelshark"
         OLD_RPATH "/usr/local/src/trace-cmd/kernel-shark/lib:"
         NEW_RPATH "/usr/local/lib/kernelshark/")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/kernelshark")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/kshark-record" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/kshark-record")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/kshark-record"
         RPATH "/usr/local/lib/kernelshark/")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/kshark-record")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/usr/local/src/trace-cmd/kernel-shark/bin/kshark-record")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/kshark-record" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/kshark-record")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/kshark-record"
         OLD_RPATH "/usr/local/src/trace-cmd/kernel-shark/lib:"
         NEW_RPATH "/usr/local/lib/kernelshark/")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/kshark-record")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0"
         RPATH "/usr/local/lib/kernelshark/")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib/kernelshark" TYPE SHARED_LIBRARY FILES "/usr/local/src/trace-cmd/kernel-shark/lib/libkshark-gui.so.1.0.0")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0"
         OLD_RPATH "/usr/local/src/trace-cmd/kernel-shark/lib:"
         NEW_RPATH "/usr/local/lib/kernelshark/")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/lib/kernelshark/libkshark-gui.so.1.0.0")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/applications/kernelshark.desktop")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/applications" TYPE FILE FILES "/usr/local/src/trace-cmd/kernel-shark/kernelshark.desktop")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/icons/kernelshark/KS_icon_shark.svg;/usr/local/share/icons/kernelshark/KS_icon_fin.svg")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/icons/kernelshark" TYPE FILE FILES
    "/usr/local/src/trace-cmd/kernel-shark/icons/KS_icon_shark.svg"
    "/usr/local/src/trace-cmd/kernel-shark/icons/KS_icon_fin.svg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/share/polkit-1/actions/org.freedesktop.kshark-record.policy")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/share/polkit-1/actions" TYPE FILE FILES "/usr/local/src/trace-cmd/kernel-shark/org.freedesktop.kshark-record.policy")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/kshark-su-record")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/bin" TYPE PROGRAM FILES "/usr/local/src/trace-cmd/kernel-shark/bin/kshark-su-record")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/usr/local/src/trace-cmd/kernel-shark/build/src/plugins/cmake_install.cmake")

endif()

