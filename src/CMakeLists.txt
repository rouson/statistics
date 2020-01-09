add_subdirectory(git-submodule/quick_sort)
#
add_executable (statistics-driver-test test.f90)
#
install (
     TARGETS statistics-driver-test
     DESTINATION bin
)
#
set_property (
     TARGET statistics-driver-test
     PROPERTY RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
)
#
target_link_libraries (statistics-driver-test statistics-mods)
#
target_include_directories ( statistics-driver-test
     PUBLIC $<BUILD_INTERFACE:${statistics_mod_dir}> $<INSTALL_INTERFACE:include/statistics>
)
#
