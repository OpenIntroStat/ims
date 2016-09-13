library(openintro)
data(COL)

pdf('choosingZForCI.pdf', 1.2*6.3, 1.2*3.2)
par(mar=c(3.3,1,.5,1), mgp=c(2.1,0.6,0))
X <- rev(seq(-4, 4, 0.025))
Y <- dt(X, 10) # makes better visual
plot(X, Y, type='l', xlab='standard deviations from the mean', ylab='', axes=FALSE, xlim=3.3*c(-1,1), ylim=c(0, 0.59), col=COL[6])
axis(1, at=-3:3) #at=c(-4, -2, 0, 2, 4))
abline(h=0) #, col='#00000088')
yMax <- 0.41
X <- seq(-4, 4, 0.025)
Y <- dt(X, 10) # makes better visual
lines(X, Y, col=COL[6])

these <- (X < 2.58 & X > -2.58)
x <- c(-2.58, X[these], 2.58)
y <- c(0, dt(X[these], 10), 0)
polygon(x, y, col=COL[1,3], border='#00000000')
these <- (X < 1.96 & X > -1.96)
x <- c(-1.96, X[these], 1.96)
y <- c(0, dt(X[these], 10), 0)
polygon(x, y, col=COL[1], border='#00000000')

#x <- 1.96*c(-1,1,1,-1)
#y <- c(1,1,1.38,1.38)*yMax/3 
#polygon(x, y, border='#FFFFFF55', col='#FFFFFF77', lwd=7)
lines(1.96*c(-1,1), rep(yMax,2), lwd=2)
lines(rep(-1.96,2), c(0,yMax), lty=2, col=COL[6])
lines(rep( 1.96,2), c(0,yMax), lty=2, col=COL[6])
text(0, yMax, '95%, extends -1.96 to 1.96', pos=3)

yMax <- 0.53
#x <- 2.58*c(-1,1,1,-1)
#y <- c(1,1,1.19,1.19)*2*yMax/3 
#polygon(x, y, border='#FFFFFF55', col='#FFFFFF77', lwd=7)
lines(2.58*c(-1,1), rep(yMax,2), lwd=2)
lines(rep(-2.58,2), c(0,yMax), lty=2, col='#00000055')
lines(rep( 2.58,2), c(0,yMax), lty=2, col='#00000055')
text(0, yMax, '99%, extends -2.58 to 2.58', pos=3)

dev.off()