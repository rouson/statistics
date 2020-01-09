#
add_executable (driver-test test.f90)
#
install (
     TARGETS driver-test
     DESTINATION bin
)
#
set_property (
     TARGET driver-test
     PROPERTY RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
)
#
target_link_libraries (driver-test statistics-mods)
#
target_include_directories ( driver-test
     PUBLIC $<BUILD_INTERFACE:${statistics_mod_dir}> $<INSTALL_INTERFACE:include/statistics>
)
#
