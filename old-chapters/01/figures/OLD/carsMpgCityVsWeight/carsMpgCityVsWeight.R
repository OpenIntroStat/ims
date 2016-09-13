library(openintro)
library(Cairo)
data(cars)

CairoPDF("carsMpgCityVsWeight.pdf", 1.1*4.95, 1.1*3.3)

par(mar=c(3.3, 3.6, 0.5, 0.5), mgp=c(2.5, 0.6, 0), cex.lab=0.95, las=1, tcl=-0.3)
COL <- c('#55000088','#55669955')

plot(cars$weight, cars$mpgCity, xlab='', ylab='miles per gallon (city rating)', pch=20, col=COL[1], axes=FALSE)
axis(1, at=seq(2000, 4000, 1000))
axis(2, seq(20, 40, 10))
mtext("weight (pounds)", 1, line=2.1, cex=0.95)
box()

dev.off()
