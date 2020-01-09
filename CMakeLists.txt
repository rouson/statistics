#
#######################################################################
# CMAKE minimum version
#######################################################################
#
cmake_minimum_required(VERSION 3.14.0)
#
#######################################################################
# Default to build a DEBUG version of the code for testing
#######################################################################
#
set (CMAKE_BUILD_TYPE_INIT Debug)
#
#######################################################################
# Project version
#######################################################################
#
set (VERSION_MAJOR 0)
set (VERSION_MINOR 001)
#
#######################################################################
# Set the type/configuration of build to perform
#######################################################################
#
set (ALLOWED_BUILD_TYPES "Debug" "Release")
set (CMAKE_BUILD_TYPE "Debug" CACHE STRING "Select which configuration to build.")
set_property (CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${ALLOWED_BUILD_TYPES})
#
#######################################################################
# Print project logo, version and tag line
#######################################################################
#
file    (READ ${CMAKE_CURRENT_LIST_DIR}/logo.txt LOGO)
string  (JOIN "\n         " GREETING "${LOGO}" "Version:    ${VERSION_MAJOR}.${VERSION_MINOR}")
string  (APPEND GREETING "\n         Build type: ${CMAKE_BUILD_TYPE}")
string  (APPEND GREETING "\n")
string  (PREPEND GREETING "\n")
message (STATUS "${GREETING}")


#######################################################################
#######################################################################
#      Begin statistics-specific targets and configuration            #
#######################################################################
#######################################################################


#
#######################################################################
# Set the project name
#######################################################################
#
project ( statistics
     VERSION "${VERSION_MAJOR}.${VERSION_MINOR}"
     LANGUAGES Fortran
)
#
#######################################################################
# cmake root for needed modules, license under Sorcery Institute
#######################################################################
#
list (INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_LIST_DIR}/cmake-modules/")
include (PlatformAbstraction) # Set compiler options based on platform and compiler
include (AddLibFunction)      # Function that adds libraries
#
#######################################################################
# Add subdirectories where code is
#######################################################################
#
set (statistics_mod_dir ${CMAKE_CURRENT_BINARY_DIR}/src/modules)
add_subdirectory (src)
add_subdirectory (src/modules)
#
#######################################################################
# Add unit tests and define the string that is used to signal success
#######################################################################
#
enable_testing()
set (test_list driver-test)
foreach(test ${test_list})
  add_test (
     NAME "${test}"
     COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${test}
     WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)
  set_property (
     TEST "${test}"
     PROPERTY PASS_REGULAR_EXPRESSION "Test passed"
)
endforeach()
#
add_custom_target ( RUN_ALL_statistics_TESTS
     COMMAND ${CMAKE_CTEST_COMMAND} -C $<CONFIG> --output-on-failure -L "read_mctal"
)
#
set_property (
     TARGET RUN_ALL_statistics_TESTS
     PROPERTY FOLDER "All-Tests"
)
