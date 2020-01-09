#!/bin/csh
#
if ( $1 == "GCC" ) then
    CAF_COMPILER
    CMAKE
    setenv FC  `which gfortran`
    setenv CC  `which gcc`
    setenv CXX `which g++`
    set compiler=gcc
else if ( $1 == "Intel" ) then
    INTEL_COMPILER
    CMAKE
    setenv FC  `which ifort`
    setenv CC  `which icc`
    setenv CXX `which icpc`
    set compiler=intel
else
    echo "Either need to use -GCC- or -Intel- as the first argument"
    exit
endif
if ( -e build-${compiler} ) then
    rm -rf build-${compiler}
endif
mkdir build-${compiler}
cdn   build-${compiler}
cmake ..
make
