#!/bin/bash

set -e
set -x

inline=/home/gmap/mrpm/marguina/fxtran-acdc/bin/inlineExternalSubroutine.pl 

$inline cuddrafn.F90 cuadjtq.F90  
$inline cudlfsn.F90 cuadjtq.F90
$inline cuascn.F90 cuadjtq.F90
$inline cubasen.F90 cuadjtq.F90
$inline cuinin.F90 cuadjtq.F90
$inline cuascn.F90 cuentr.F90
$inline cuascn.F90 cubasmcn.F90
$inline cuinin.F90 cuadjtqs.F90

$inline cuascn.F90 cubasmcn.F90 cuentr.F90 cuadjtq.F90
