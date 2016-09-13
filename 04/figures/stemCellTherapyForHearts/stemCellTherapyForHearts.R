library(openintro)
data(COL)

d <- read.delim('stemCell.txt')

change <- d[,3] - d[,2]
#plot(change ~ d[,1])
t.test(change ~ d[,1])

myPDF('stemCellTherapyForHearts.pdf', 4, 5, mar=c(4, 1.8, 3, 0.7), mgp=c(2, 0.45, 0), mfrow=c(2,1), las=1)
histPlot(change[d[,1] == 'esc'], xlim=c(-10, 15), axes=FALSE, main='', breaks=seq(-10, 15, 2.5), xlab='', col=COL[1])
axis(1, cex.axis=0.85)
mtext('Embryonic stem cell transplant', line=1.5, cex=1.25)
mtext('Percent change in heart pumping function', 1, line=1.5, cex=0.9)
par(mgp=c(2, 0.6, 0))
axis(2, at=0:3, cex.axis=0.925)

par(mar=c(2.6, 1.8, 4, 0.7))
par(mgp=c(2, 0.5, 0))
histPlot(change[d[,1] == 'ctrl'], xlim=c(-10, 15), axes=FALSE, main='', breaks=seq(-10, 15, 2.5), xlab='', col=COL[1])
axis(1, cex.axis=0.85)
par(mgp=c(2, 0.6, 0))
axis(2, at=0:3, cex.axis=0.925)
mtext('Control (no treatment)', line=1.5, cex=1.25)
mtext('Percent change in heart pumping function', 1, line=1.5, cex=0.9)

dev.off()