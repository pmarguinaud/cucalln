#!/bin/bash

set -e
set -x

\rm -f 1.txt 2.txt

./scripts/compile.pl --arch cpu_nvhpc_d --compile 

export OMP_NUM_THREADS=1

./compile.cpu_nvhpc_d/main_cucalln_mf.x --case t0031.cpu_intel_d --stack 60 --nproma 32 --ngpblks 1 --verbose --case-ref t0031.cpu_nvhpc_d                    > 1.txt 2>&1
#\mv fort.77 fort.77.full
./compile.cpu_nvhpc_d/main_cucalln_mf.x --case t0031.cpu_intel_d --stack 60 --nproma 32 --ngpblks 1 --verbose --case-ref t0031.cpu_nvhpc_d  --single-column   > 2.txt 2>&1
#\mv fort.77 fort.77.single

diff 1.txt 2.txt
