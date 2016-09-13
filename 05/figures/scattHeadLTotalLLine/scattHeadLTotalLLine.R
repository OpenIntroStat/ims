require(openintro)
data(COL)
data(possum)
set.seed(1)

myPDF('scattHeadLTotalLLine.pdf', 6, 4, mar=c(3.4,3.4,0.5,1), mgp=c(2.3,0.5,0), las=1) #, mfrow=1:2)

these <- c(48, 42, 3)

plot(possum$totalL[-these], possum$headL[-these], pch=20, col=COL[1,2], cex=1.7, xlab='Total length (cm)', ylab='Head length (mm)')

points(possum$totalL[these] + rnorm(3,0,0.02),
       possum$headL[these] + rnorm(3,0,0.02),
       pch=c(3,4,2), col=COL[4], cex=1.5, lwd=2.5)

abline(41, 0.59, col=COL[5])

for(i in 1:3){
	lines(rep(possum$totalL[these[i]], 2),
		c(possum$headL[these[i]], 41+0.59*possum$totalL[these[i]]),
		lty=3, lwd=1.5, col=COL[4])
}

dev.off()
