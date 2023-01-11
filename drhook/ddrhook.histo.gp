
set terminal postscript eps enhanced color solid font "Courrier 14 Bold" linewidth 2


set output "CUCALLN.t1798.dist.eps"

sql = \
  '<sqlite3 -column cucalln.db "select sum(Total) AS sum_total from DrHookTime where Name = \"CUCALLN_MF\" GROUP BY Task ORDER BY sum_total DESC ;" ' 


set grid
set key noenhanced

set title "ARPEGE T1798C2.2; 20 AMD Rome nodes x 16 MPI x 8 OpenMP; 6h"
set ylabel "Time (s)"

plot [*:*][0:] sql using 1 lc "blue"   with lines ti "CUCALLN_MF time distribution over MPI tasks"
