library(openintro)
data(COL)

myPDF("subtracting2Areas.pdf", 4, 0.7, mar=c(0,0,0,0), mgp=c(3,0,0))
X <- seq(-3.2,3.2,0.01)
Y <- dnorm(X)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,24+3.4), ylim=c(0,0.6))
lines(X, rep(0,length(X)))
these <- which(X <= 8)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
lines(X, Y)
#abline(h=0)
#lines(c(0,0), dnorm(0)*c(0.01,0.99), col='#CCCCCC', lty=3)

lines(c(3,8-3), c(0.2,0.2), lwd=3)

lines(X+8, Y, type='l')
lines(X+8, rep(0,length(X)))
these <- which(X < -0.303)
polygon(c(X[these[1]], X[these],X[rev(these)[1]])+8, c(0,Y[these],0), col=COL[1])
lines(X+8, Y)
#lines(c(0,0), dnorm(0)*c(0.01,0.99), col='#CCCCCC', lty=3)

lines(8+c(3,8-3), c(0.2,0.2), lwd=3)

lines(X+16, Y, type='l')
lines(X+16, rep(0,length(X)))
these <- which(X > 1.212)
polygon(c(X[these[1]], X[these],X[rev(these)[1]])+16, c(0,Y[these],0), col=COL[1])
lines(X+16, Y)
#lines(c(0,0), dnorm(0)*c(0.01,0.99), col='#CCCCCC', lty=3)

lines(16+c(3,8-3), c(0.23,0.23), lwd=3)
lines(16+c(3,8-3), c(0.17,0.17), lwd=3)

lines(X+24, Y, type='l', xlim=c(-3.4,3.4))
lines(X+24, rep(0,length(X)))
these <- which(X > -0.303 & X < 1.212)
polygon(c(X[these[1]], X[these],X[rev(these)[1]])+24, c(0,Y[these],0), col=COL[1])
lines(X+24, Y)
#lines(c(0,0), dnorm(0)*c(0.01,0.99), col='#CCCCCC', lty=3)

text(0,0.53, "1.0000")
text(8,0.53, "0.3821")
text(16,0.53, "0.1131")
text(24,0.53, "0.5048")

dev.off()
