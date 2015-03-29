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
set xr [1:10]
set yr [1:10]
set xtics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8) font ",18"
set ytics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8) font ",18"
set key font ",14"
set key right bottom box

plot \
       "parallelSU.dat" u 1:2 w lp lw 3 ps 1 pt 4 t "0.79 million unknowns", \
       "parallelSU.dat" u 1:3 w lp lw 3 ps 1 pt 6 t "3.15 million unknowns", \
       "parallelSU.dat" u 1:4 w lp lw 3 ps 1 pt 8 t "12.6 million unknowns", \
       "parallelSU.dat" u 1:5 w lp lw 1 ps 0 t "Linear scaling"


# Print plot
#load './plotPrintPS.gnu'
load './plotPrintPDF.gnu'
#!ps2pdf './printme.ps' './psu.pdf'
!mv './printme.pdf' './psu.pdf'
!pdfcrop './psu.pdf' './psu.pdf'
!evince './psu.pdf'
