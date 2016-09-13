
require(Cairo)
CairoPDF('scattHeadLTotalLResidualPlots.pdf', 7, 3.5)

COL <- c('#550000AA','#55669988', '#660000')
these <- c(48, 42, 3)

par(mar=c(4,4,1,1), mgp=c(2.8,0.9,0), las=1, mfrow=1:2)
plot(possum$totalL[-these], possum$headL[-these]-(41+0.59*possum$totalL[-these]), pch=20, col=COL[2], cex=1.7, xlab='total length (cm)', ylab='residuals', ylim=c(-7, 12))
points(possum$totalL[these], possum$headL[these]-(41+0.59*possum$totalL[these]), pch=c(3,4,2), col=COL[3], cex=1.3)
abline(h=0, lty=2)

par(mar=c(4, 5, 1, 0))
plot(possum$totalL[-these], possum$headL[-these]-(54+0.4*possum$totalL[-these]), pch=20, col=COL[2], cex=1.7, xlab='total length (cm)', ylab='residuals', ylim=c(-7, 12))
points(possum$totalL[these], possum$headL[these]-(54+0.4*possum$totalL[these]), pch=c(3,4,2), col=COL[3], cex=1.3)
abline(h=0, lty=2)


dev.off()
