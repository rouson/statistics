#
add_lib ( statistics-mods
     LINKAGE STATIC
     SOURCES
          "kind_parameters_mod.f90"
	  "statistical_data_mod.f90"
    	  "statistical_accessors_smod.f90"
	  "statistical_mean_smod.f90"
	  "statistical_variance_smod.f90"
	  "statistical_std_dev_smod.f90"
	  "statistical_skewness_smod.f90"
	  "statistical_kurtosis_smod.f90"
	  "statistical_median_smod.f90"
)
#
set_property (
     TARGET statistics-mods
     PROPERTY LIBRARY_OUTPUT_NAME statistics
)
#
set_property (
     TARGET statistics-mods
     PROPERTY Fortran_MODULE_DIRECTORY ${statistics_mod_dir}
)
#
target_link_libraries (statistics-mods
   quick_sort-mods
)
target_include_directories (statistics-mods
   PUBLIC $<TARGET_PROPERTY:quick_sort-mods,Fortran_MODULE_DIRECTORY>
)
