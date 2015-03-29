# Gnuplot script file for plotting data from file "..."
set   autoscale                        # scale axes automatically
set logscale
unset label                            # remove any previous labels
#set format y "%.0e"
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
#set title "title"
#set xlabel "Number of processors" font "Helvetica,18"
#set ylabel "Speedup factors" font "Helvetica,18"
set xlabel "Variables" offset +0,+0 font ",14"
set ylabel "Iterations" offset +0,0 font ",14"
unset grid
#set xr [1:14]
#set yr [1:14]
#%set xtics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10, "12" 12) font ",16"
#%set ytics ("1" 1, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10, "12" 12) font ",16"
#set key font ",8"
set key right top box

plot \
       "FGaBP_itr_quad_1.dat" u 2:3 w lp lw 3 ps 1 pt 4 t "1st order quads", \
       "FGaBP_itr_quad_2.dat" u 2:3 w lp lw 3 ps 1 pt 6 t "2nd order quads", \
       "FGaBP_itr_quad_3.dat" u 2:3 w lp lw 3 ps 1 pt 8 t "3rd order quads", \
       "FGaBP_itr_hex_1.dat" u 2:3 w lp lw 3 ps 1 pt 5 t "1st order hexs", \
       "FGaBP_itr_hex_2.dat" u 2:3 w lp lw 3 ps 1 pt 7 t "2nd order hexs", \
       "FGaBP_itr_hex_3.dat" u 2:3 w lp lw 3 ps 1 pt 9 t "3rd order hexs", \
       "FGaBP_itr_quad_ls.dat" u 1:2 w lp lw 1 ps 0 t "Linear scaling"


# Print plot
#load './plotPrintPS.gnu'
load './plotPrintPDF.gnu'
#!ps2pdf './printme.ps' './psu.pdf'
!mv './printme.pdf' './FGaBP_itrs.pdf'
!pdfcrop './FGaBP_itrs.pdf' './FGaBP_itrs.pdf'
!evince './FGaBP_itrs.pdf'
