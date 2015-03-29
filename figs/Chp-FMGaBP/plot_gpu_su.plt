# Gnuplot script file for plotting data from file "..."
set   autoscale                        # scale axes automatically
set logscale
#set format y "%.0e"
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
#set xlabel "Variables" offset +0,+0 font ",14"
#set ylabel "Error" offset +0,0 font ",14"
set xlabel "Cores"
set ylabel "Speedup Factors"
unset grid
set grid ytics
set xr [1:18]
set yr [0.5:10]
set xtics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10, "12" 12, "16" 16) font ",16"
#%set ytics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10, "12" 12) font ",16"
#set key font ",8"
set key right top nobox

plot \
       "gpu_su.dat" u 1:2 w lp lw 4 ps 2 pt 2 lt 1 t "0.262M Unknowns", \
       "gpu_su.dat" u 1:3 w lp lw 4 ps 2 pt 4 lt 3 t "1.04M Unknowns", \
       "gpu_su.dat" u 1:4 w lp lw 4 ps 2 pt 6 lt 5 t "4.19M Unknowns", \
