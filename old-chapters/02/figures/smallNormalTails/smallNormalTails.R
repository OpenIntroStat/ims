
#===> plot <===#
par(las=1, mar=c(1.5,1,0.5,1), mgp=c(3,0.6,0), mfrow=c(1,2))
X <- seq(-4,4,0.01)
Y <- dnorm(X)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5,-0.8,0,5), label=c(-5,'-Z',0,5), cex.axis=0.7)
these <- which(X <= -0.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col='#CCCCCC')
lines(X, Y)
abline(h=0)
lines(c(0,0), c(0,dnorm(0)), col='#CCCCCC', lty=3)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5,0.8,0,5), label=c(-5,'Z',0,5), cex.axis=0.7)
these <- which(X >= 0.8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col='#CCCCCC')
lines(X, Y)
abline(h=0)
lines(c(0,0), c(0,dnorm(0)), col='#CCCCCC', lty=3)
