# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 500, 350 
# set output 'random.3.png'
set dummy u,v
#set format x "%3.2f"
#set format y "%3.2f"
set format z "%3.2f"
unset key
set parametric
set view 68, 28, 1, 1
set samples 50, 50
set isosamples 30, 30
set contour base
unset clabel
set hidden3d front offset 1 trianglepattern 3 undefined 1 altdiagonal bentover
set cntrparam levels discrete 0.1,0.05,0.01
set style function dots
set ticslevel 0
set ztics 0.00000,0.05 norangelimit
set urange [ -2.5 : 3.5 ] noreverse nowriteback
set vrange [ -2.5 : 3.5 ] noreverse nowriteback
set xrange [ -2.5 : 3.5 ] noreverse nowriteback
set yrange [ -2.5 : 3.5 ] noreverse nowriteback
set zrange [ -0.2 : 0.2 ] noreverse nowriteback
splot u,v,( 1/(2*pi) * exp(-0.5 * ((u-0.5)**2 + (v-0.5)**2)) ) with line lc rgb "black"
set label 2 "{/Symbol m}" at 0.5,0.5,-0.2 point pt 0
set ytics offset 0,-0.2

# Print plot
#load './plotPrintPS.gnu'
load './plotPrintPDF3D.gnu'
#!ps2pdf './printme.ps' './psu.pdf'
!mv './printme.pdf' './gauPlot3D.pdf'
!pdfcrop './gauPlot3D.pdf' './gauPlot3D.pdf'
!evince './gauPlot3D.pdf'
