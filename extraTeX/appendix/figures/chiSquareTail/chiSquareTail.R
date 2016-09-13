library(openintro)
data(COL)

pdf('chiSquareTail.pdf', 3.5, 2.1)
#===> plot <===#
par(las=1, mar=c(2,1,0.5,1), mgp=c(3,0.8,0), mfrow=c(1,1))
X <- seq(0,25,0.05)
Y <- dchisq(X, 3.5)

plot(X, Y, type='l', axes=FALSE, xlim=c(0,15))
axis(1) #, at=c(-5,0,5), cex.axis=0.7, tick=FALSE)
these <- which(X >= 5.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
abline(h=0)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

dev.off()