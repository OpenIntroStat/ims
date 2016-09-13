library(openintro)
data(COL)
data(possum)

pdf('posNegCorPlots.pdf', 6, 3.6)

COL <- COL[1,2]
set.seed(1)

par(mfrow=c(2,4), mar=c(2.7, rep(0.5, 3)), mgp=c(1,0,0))

n <- 50
x <- c(runif(n[1]-2, 0, 4), 2, 2.1)
y <- 0.8*x + rnorm(n[1], sd=5)
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-0.2, 4.2), ylim=c(-9, 17), xlab='')
box()
mtext(paste('R =', round(cor(x,y), 2)), side=1, line=1, cex=1.1)

plot(possum$totalL, possum$headL, pch=20, col=COL[1], cex=1.351, xlab='', ylab='', axes=FALSE)
box()
mtext(paste('R =', round(cor(possum$totalL, possum$headL), 2)), side=1, line=1, cex=1.1)

n <- 50
x <- c(runif(n[1]-2, 0, 4), 2, 2.1)
y <- 2*x + rnorm(n[1], sd=0.5)
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-0.2, 4.2), ylim=c(-2, 9.6), xlab='')
box()
mtext(paste('R =', round(cor(x,y), 2)), side=1, line=1, cex=1.1)

n <- 50
x <- runif(n[1])
y <- x
y[y < -2] <- -1.5
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-0.03, 1.03), ylim=c(-.1, 1.1), xlab='')
box()
mtext(paste('R =', format(c(round(cor(x,y), 2), 0.01))[1]), side=1, line=1, cex=1.1)

par(mar=c(2.1,0.5,1.1,0.5))

n <- 50
x <- c(runif(n[1]-2, 0, 4), 2, 2.1)
y <- -0.5*x + rnorm(n[1], sd=5)
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-0.2, 4.2), ylim=c(-17, 14), xlab='')
box()
mtext(paste('R =', round(cor(x,y), 2)), side=1, line=1, cex=1.1)

n <- 50
x <- runif(n[1], -4.8, 4.8)
y <- -x+rnorm(n[1], sd=3)
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-5.2, 5.2), ylim=c(-12, 10), xlab='')
box()
mtext(paste('R =', format(c(round(cor(x,y), 2), 0.01))[1]), side=1, line=1, cex=1.1)

n <- 50
x <- runif(n[1])
y <- -9*x + rnorm(n[1])
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-0.03, 1.03), ylim=c(-10, 2), xlab='')
box()
mtext(paste('R =', round(cor(x,y), 2)), side=1, line=1, cex=1.1)

n <- 50
x <- runif(n[1])
y <- -x
y[y < -2] <- -1.5
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlim=c(-0.03, 1.03), ylim=c(-1.2, .2), xlab='')
box()
mtext(paste('R =', format(c(round(cor(x,y), 2), 0.01))[1]), side=1, line=1, cex=1.1)


dev.off()

