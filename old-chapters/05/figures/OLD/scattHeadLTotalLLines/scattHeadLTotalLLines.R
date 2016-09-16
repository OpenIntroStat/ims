
require(Cairo)
CairoPDF('scattHeadLTotalLLines.pdf', 8, 4)

COL <- c('#550000AA','#55669988', '#660000')
these <- c(48, 42, 3)

par(mar=c(4,4,1,1), mgp=c(2.8,0.9,0), las=1, mfrow=1:2)
plot(possum$totalL[-these], possum$headL[-these], pch=20, col=COL[2], cex=1.7, xlab='total length (cm)', ylab='head length (mm)')
points(possum$totalL[these], possum$headL[these], pch=c(3,4,2), col=COL[3], cex=1.3)
abline(41, 0.59)
for(i in 1:3){
	lines(rep(possum$totalL[these[i]], 2), c(possum$headL[these[i]], 41+0.59*possum$totalL[these[i]]), lty=3, col=COL[3])
}

#points(89, 94.1, col=COL[1], cex=1.7, pch=20)
#lines(rep(89,2), c(0,94.1), lty=2, col=COL[1])
#lines(c(0,89), rep(94.1,2), lty=2, col=COL[1])

plot(possum$totalL[-these], possum$headL[-these], pch=20, col=COL[2], cex=1.7, xlab='total length (cm)', ylab='head length (mm)')
points(possum$totalL[these], possum$headL[these], pch=c(3,4,2), col=COL[3], cex=1.3)
abline(54, 0.4)
for(i in 1:3){
	lines(rep(possum$totalL[these[i]], 2), c(possum$headL[these[i]], 54+0.4*possum$totalL[these[i]]), lty=3, col=COL[3])
}

possum[these, ]
which(possum$headL > 97)


dev.off()
