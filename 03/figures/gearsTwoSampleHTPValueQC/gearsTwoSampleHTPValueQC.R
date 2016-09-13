library(openintro)
data(COL)

pdf('gearsTwoSampleHTPValueQC.pdf', 3.8, 1.95)

par(las=1, mar=c(2.4,0,0.5,0), mgp=c(3,0.5,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5, 0, 2.3, 5), label=c(0, 0.03, 0.059, 0), cex.axis=0.9)
these <- which((X >= 2.3))
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1], lwd=0.5)

lines(X, Y)
abline(h=0)
par(mgp=c(5, 1.3, 0))
axis(1, at=0, '(null value)', cex.axis=0.7)

arrows(2.5, 0.19, 2.5, 0.05, length=0.1, col=COL[1])
text(2.5, 0.18, "0.006", pos=3, cex=0.8, col=COL[1])

dev.off()