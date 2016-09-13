library(openintro)
data(COL)

pdf('type1ErrorDoublingExampleFigure.pdf', 5.5, 2)

#===> plot <===#
par(las=1, mar=c(2,0,0.5,0), mgp=c(3,0.9,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5, 0, 5), label=expression(0, 0, 0), cex.axis=1.2)
these <- which(X >= 1.65)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
these <- which(X <= -1.65)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])

arrows(-2,0.17, -1.9, 0.08, length=0.07, col=COL[1], lwd=1.5)
text(-1.92, 0.21, '5%', cex=1.2, col=COL[1])
arrows(2,0.17, 1.9, 0.08, length=0.07, col=COL[1], lwd=1.5)
text(2.08, 0.21, '5%', cex=1.2, col=COL[1])

lines(X, Y, lwd=1.5)
abline(h=0)


dev.off()
