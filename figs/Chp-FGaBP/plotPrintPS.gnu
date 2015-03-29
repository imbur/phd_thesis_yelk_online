# Gnuplot plot save in PS
#set term postscript landscape enhanced mono dashed lw 1 "Helvetica" 14
set term postscript enhanced mono dashed lw 2
#set term postscript enhanced mono dashed lw 2
set output "printme.ps"
replot
set term x11
