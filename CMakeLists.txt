cmake_minimum_required(VERSION 3.30.0)

# Project name
project(capstone-project LANGUAGES C)

# Set build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)

# GCC pedantic compiler options
set(gcc_compiler_options "-std=gnu11 -Wextra -Wall -Werror -Wpedantic -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wstrict-prototypes \
-Wwrite-strings -Wcast-qual -Waggregate-return -Wswitch-default -Wformat=2")

# Compiler options for build types
if(CMAKE_BUILD_TYPE MATCHES Release)
   set(CMAKE_C_FLAGS_RELEASE "-03 ${gcc_compiler_options}")
endif(CMAKE_BUILD_TYPE MATCHES Release)

if(CMAKE_BUILD_TYPE MATCHES Debug)
   set(CMAKE_C_FLAGS_DEBUG "-Og -save-temps -g -gdwarf-3 -gstrict-dwarf ${gcc_compiler_options}")
endif(CMAKE_BUILD_TYPE MATCHES Debug)

# Include paths
include(${CMAKE_SOURCE_DIR}/curses.cmake)
include_directories(${CMAKE_SOURCE_DIR})

# library and application directories
add_subdirectory(${CMAKE_SOURCE_DIR}/src/)
