#!/usr/bin/gnuplot

set terminal postscript eps enhanced color solid font "Courrier 14 Bold" linewidth 2
set output "cucalln.eps"

set key noenhanced

array arch[2]

arch[1] = "cpu_intel_d"
arch[2] = "gpu_nvhpc_d"

set xlabel "Number of grid-points"
set ylabel "Speed (number of grid points processed per second)"

array col[3]
col[1] = "red"
col[2] = "blue"
col[3] = "green"

plot for [i=1:2] '<sqlite3 -column cucalln.db "SELECT NPROMA * NGPBLKS, 1./ZTC FROM timings WHERE clarch = \"' . arch[i] . '\""' \
  using 1:2:xtic(1) with lines  title arch[i] lc rgb col[i]


