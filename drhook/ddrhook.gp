
set terminal postscript eps enhanced color solid font "Courrier 14 Bold" linewidth 2


kind = "Total"

set output "CUCALLN.t1798." . kind. ".eps"

sql = \
  '<sqlite3 -column cucalln.db "select Name, Min, Avg, Max from DrHookTime_Merge' . kind . ' where Name in ' \
  . ' (\"CUCALLN_MF\", \"CUMASTRN\", \"CUCCDIA\", \"CUININ\", \"CUBASEN\", \"CUASCN\", \"CUDLFSN\", ' \
  . '  \"CUDDRAFN\", \"CUFLXN\", \"CUDTDQN\", \"CUDUDV\", \"CUCTRACER\", \"CUADJTQS\", \"CUBASMCN\", ' \
  . '  \"CUENTR\", \"CUADJDQ\", \"CUBIDIAG\", \"SATUR\") ' \
  . ' ORDER BY Max DESC ;" ' 

set grid

set title "ARPEGE T1798C2.2; 20 AMD Rome nodes x 16 MPI x 8 OpenMP; 6h"
set ylabel "Time (s)"

set style data histogram
set style histogram cluster
set style fill solid border -1
set xtic rotate by -45 scale 0 noenhanced

plot sql using 2:xtic(1) lc "blue"  ti "Min(" . kind . ")", \
     ''  using 3         lc "white" ti "Avg(" . kind . ")", \
     ''  using 4         lc "red"   ti "Max(" . kind . ")"
