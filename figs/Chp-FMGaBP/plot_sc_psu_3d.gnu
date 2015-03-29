# Gnuplot script file for plotting data from file "..."
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
set logscale
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
#set title "title"
#set xlabel "Number of processors" font "Helvetica,18"
#set ylabel "Speedup factors" font "Helvetica,18"
set xlabel "Number of threads" offset +0,+0 font ",16"
set ylabel "Speedup factors" offset -0.5,0 font ",16"
unset grid
set xr [1:18]
set yr [1:18]
set xtics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10, "12" 12, "14" 14, "16" 16) font ",16"
set ytics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10, "12" 12, "  " 14, "16" 16) font ",16"
set key font ",12"
set key width -2.7
set key right bottom box

plot \
       "parallelSU_3d.dat" u 1:2 w lp lw 3 ps 1 pt 4 t "0.036 million unknowns", \
       "parallelSU_3d.dat" u 1:3 w lp lw 3 ps 1 pt 6 t "0.275 million unknowns", \
       "parallelSU_3d.dat" u 1:4 w lp lw 3 ps 1 pt 8 t "2.147 million unknowns", \
       "parallelSU_3d.dat" u 1:5 w lp lw 3 ps 1 pt 12 t "16.97 million unknowns", \
       "parallelSU_3d.dat" u 1:6 w lp lw 1 ps 0 t "Linear scaling"


# Print plot
#load './plotPrintPS.gnu'
load './plotPrintPDF.gnu'
#!ps2pdf './printme.ps' './psu.pdf'
!mv './printme.pdf' './psu_3d.pdf'
!pdfcrop './psu_3d.pdf' './psu_3d.pdf'
!evince './psu_3d.pdf'
