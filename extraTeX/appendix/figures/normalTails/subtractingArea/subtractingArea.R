library(openintro)
data(COL)

pdf('subtractingArea.pdf', 8, 1.67)

#===> plot <===#
par(las=1, mar=c(0,0,0,0), mgp=c(3,0,0), mfrow=c(1,1))
X <- seq(-3.2,3.2,0.01)
Y <- dnorm(X)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,16+3.4), ylim=c(0, 0.622))
lines(X, rep(0,length(X)))
these <- which(X <= 8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
#abline(h=0)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

lines(c(3,8-3), c(0.2,0.2), lwd=3)
text(0, 0.549283, format(c(1, 0.0001), scientific=FALSE)[1], cex=1.69238)


lines(X+8, Y, type='l', xlim=c(-3.4,3.4))
lines(X+8, rep(0,length(X)))
these <- which(X <= 0.43)
polygon(c(X[these[1]], X[these],X[rev(these)[1]])+8, c(0,Y[these],0), col=COL[1])
lines(X+8, Y)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)

lines(8+c(3,8-3), c(0.23,0.23), lwd=3)
lines(8+c(3,8-3), c(0.17,0.17), lwd=3)
lines(c(3.72, 4.28), rep(0.549283, 2), lwd=2)
text(8, 0.549283, format(0.6664, scientific=FALSE)[1], cex=1.69238)

lines(X+8+8, Y, type='l', xlim=c(-3.4,3.4))
lines(X+8+8, rep(0,length(X)))
these <- which(X > 0.43)
polygon(c(X[these[1]], X[these],X[rev(these)[1]])+8+8, c(0,Y[these],0), col=COL[1])
lines(X+8+8, Y)
lines(c(0,0), dnorm(0)*c(0.01,0.99), col=COL[1], lty=3)
text(12, 0.549283, '=', cex=1.69238)
text(16, 0.549283, format(0.3336, scientific=FALSE)[1], cex=1.69238)

dev.off()
