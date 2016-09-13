library(openintro)
data(COL)

set.seed(2)
x <- round(rnorm(30, 120, 70))
t.test(x-100)
mean(x)
sd(x)

myPDF('satImprovementHTDataHistogram.pdf', 3.9, 2.2, mar=c(1.6, 2, 0.2, 1), mgp=c(0, 0.45, 0), las=1)
histPlot(x, xlab='', ylab='', axes=FALSE, main='', col=COL[1])
axis(1)
axis(2, at=seq(0, 10, 5))
dev.off()