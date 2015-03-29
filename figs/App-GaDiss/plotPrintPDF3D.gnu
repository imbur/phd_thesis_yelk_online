# Gnuplot plot save in PDF
#set term pdf monochrome enhanced font "Helvetica,12" dashed lw 1
set term pdf monochrome enhanced font "Helvetica,10" lw 2
set output "printme.pdf"
replot
set term x11
