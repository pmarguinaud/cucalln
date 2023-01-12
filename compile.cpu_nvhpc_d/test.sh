#!/bin/bash

set -x

nvfortran -mp -byteswapio -Mlarge_arrays -g -O2 -o main_cucalln_mf.nvfortran.x main_cucalln_mf.F90

./main_cucalln_mf.nvfortran.x

ifort \
  -I. -shared-intel -convert big_endian -assume byterecl \
  -align array64byte,all -traceback -fpic -qopenmp -qopenmp-threadprivate compat -fp-model source -qopt-report=5 \
  -qopt-report-phase=vec -ftz -diag-disable=remark,cpu-dispatch -g -O2 -march=core-avx2 -finline-functions \
  -finline-limit=500 -Winline -qopt-prefetch=4 -fast-transcendentals -fimf-use-svml -no-fma \
  -o main_cucalln_mf.ifort.x main_cucalln_mf.F90

./main_cucalln_mf.ifort.x

gfortran -fconvert=big-endian -O3 -o main_cucalln_mf.gfortran.x main_cucalln_mf.F90

./main_cucalln_mf.gfortran.x
   
