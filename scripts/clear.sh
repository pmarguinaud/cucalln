#!/bin/bash

for f in compute/*.F90
do
  b=$(basename $f)
  rm compile.gpu_d/$b
done

exit 0
