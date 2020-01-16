# This function handles the compiler and platform options
# for the following compilers:
# 1) gfortran
# 2) intel (not implemented / testted as part of this project)
#
set(CMAKE_VERBOSE_MAKEFILE OFF)
include_guard(DIRECTORY) # Check to see if the file has previously been processed

# Compiler options
if (CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
  # Intel platform specific settings
  if (WIN32) # Windows options
    set(prefix "/")
    set(infix ":")
    set(Qf "Q")
    set(Q "Q")
    set(eq ":")
    set(colon ":")
    set(colon_ ":")
  else() # *nix options
    set(prefix "-")
    set(infix " ")
    set(Qf "f")
    set(Q "")
    set(eq "=")
    set(colon "")
    set(colon_ " ")
  endif()

  set(Intel_Fortran_FLAGS_Release "${prefix}check${colon_}none ${prefix}O3")
  set(Intel_Fortran_FLAGS_Debug "${prefix}check${colon_}all ${prefix}O0")
  set(Intel_EXE_LINKER_FLAGS "${prefix}traceback ${prefix}stand${colon_}f15 ${prefix}${Q}coarray${colon_}distributed")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
  # GFortran build configs
  set(GNU_Fortran_FLAGS_Release "-fbacktrace -ffree-form -ffree-line-length-0 -std=f2018 -O3 -g1")
  set(GNU_Fortran_FLAGS_Debug "-fbacktrace -ffree-form -ffree-line-length-0 -std=f2018 -O0 -g3 -fcheck=all")
else()
  message(WARNING
    "\n"
    "Attempting to build with untested Fortran compiler: ${CMAKE_Fortran_COMPILER_ID}. "
    "Please report any failures through the task-manager Git issues\n\n"
  )
endif()
list(JOIN ${CMAKE_Fortran_COMPILER_ID}_Fortran_FLAGS_${CMAKE_BUILD_TYPE} " " CMAKE_Fortran_FLAGS) # Note: This is left out intentionally due to failing build. Issue w/ sleep function. IP 11/06/2019
