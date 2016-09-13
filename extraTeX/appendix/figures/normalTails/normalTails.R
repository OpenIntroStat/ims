library(openintro)
data(COL)

myPDF('normalTails.pdf', 4.5, 1.3, las=1, mar=c(1.3,1,0.5,1), mgp=c(3,-0.2,0), mfrow=c(1,2))
X <- seq(-4,4,0.01)
Y <- dnorm(X)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5,0,5), label=c(-5,'negative Z',5), cex.axis=0.7, tick=FALSE)
these <- which(X <= -0.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
abline(h=0)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5,0,5), label=c(-5,'positive Z',5), cex.axis=0.7, tick=FALSE)
these <- which(X <= 0.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
abline(h=0)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

dev.off()



myPDF('normalTailLeft.pdf', 2.75, 1.05, las=1, mar=c(0.9,1,0.1,3.05), mgp=c(3,-0.2,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5,0,5), label=c(-5,'negative Z',5), cex.axis=0.7, tick=FALSE)
these <- which(X <= -0.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
abline(h=0)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

dev.off()


myPDF('normalTailRight.pdf', 2.75, 1.05, las=1, mar=c(0.9,2.9,0.1,1), mgp=c(3,-0.2,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5,0,5), label=c(-5,'positive Z',5), cex.axis=0.7, tick=FALSE)
these <- which(X <= 0.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
abline(h=0)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

dev.off()
