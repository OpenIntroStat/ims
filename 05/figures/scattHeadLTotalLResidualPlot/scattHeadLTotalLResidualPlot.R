require(openintro)
data(COL)
data(possum)

myPDF('scattHeadLTotalLResidualPlot.pdf', 1.13*5.76, 1.13*3.35, mar=c(3,3,0.5,1), mgp=c(1.8,0.6,0), las=1) #, mfrow=1:2)

these <- c(48, 42, 3)

plot(possum$totalL[-these], possum$headL[-these]-(41+0.59*possum$totalL[-these]), pch=19, col=COL[1,2], xlab='Total length (cm)', ylab='Residuals', ylim=c(-7, 9))

points(possum$totalL[these]+rnorm(1,0,0.01),
       possum$headL[these]-(41+0.59*possum$totalL[these])+
          rnorm(1,0,0.01),
       pch=c(3,4,2), col=COL[4], cex=1.3, lwd=2.5)
}

abline(h=0, lty=2)


dev.off()