#!/bin/bash
#SBATCH -N1 
#SBATCH --exclusive
#SBATCH --export=NONE

set -x

cd $SLURM_SUBMIT_DIR

for b in $(cat scripts/blocks.txt)
do

numactl --physcpubind=0-63 ./compile.cpu_intel_d/main_cucalln_mf.x \
  --case t1798.cpu_intel_d --stack 60 --nproma 32 --ngpblks $b --task-list 1 66 \
  --time 10 --block-list  1 10 --verbose --out cucalln.dat

done
