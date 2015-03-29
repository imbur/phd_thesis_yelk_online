set clip two
set style fill  transparent pattern 4 border
# set key title "Gaussian Distribution"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
#set style function filledcurves y1=0
set xrange [ -5.00000 : 5.00000 ] noreverse nowriteback
set yrange [ 0.00000 : 1.00000 ] noreverse nowriteback
unset colorbox
Gauss(x,mu,sigma) = 1./(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )
d1(x) = Gauss(x, 0, 1.)
d2(x) = Gauss(x,  1.,  .5)
d3(x) = Gauss(x, -1.,  2.)
GPFUN_Gauss = "Gauss(x,mu,sigma) = 1./(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )"
GPFUN_d1 = "d1(x) = Gauss(x, 0, 1.)"
GPFUN_d2 = "d2(x) = Gauss(x,  1.,  .5)"
GPFUN_d3 = "d3(x) = Gauss(x, -1.,  2.)"
plot d1(x) title "{/Symbol m} =  0 {/Symbol s} = 1.0", d2(x) title "{/Symbol m} =  1.0 {/Symbol s} = 0.5", d3(x) title "{/Symbol m} = -1.0 {/Symbol s} = 2.0"

# Print plot
#load './plotPrintPS.gnu'
load './plotPrintPDF.gnu'
#!ps2pdf './printme.ps' './psu.pdf'
!mv './printme.pdf' './gauPlot.pdf'
!pdfcrop './gauPlot.pdf' './gauPlot.pdf'
!evince './gauPlot.pdf'
