library(openintro)
data(COL)
data(run10Samp)

set.seed(1)
m <- run10Samp$time[run10Samp$gender=='M']
mean(m); sd(m)
f <- run10Samp$time[run10Samp$gender=='F']
mean(f); sd(f)

myPDF('cbrRunTimesMenWomen.pdf', 3.8, 3, mgp=c(2.5, 0.7, 0), las=1, mar=c(2, 4, 0.5, 1))
boxPlot(m, at=1, xlim=c(0.5, 2.5), ylim=range(c(45,150)), axes=FALSE, ylab='run time (minutes)', lcol=COL[1], col=COL[1,3], lwd=1)
boxPlot(f, add=2, axes=FALSE, lcol=COL[1], col=COL[1,3], lwd=1)
axis(1, at=1:2, labels=c('men', 'women'))
axis(2, at=c(50, 100, 150))

dev.off()