library(openintro)
data(COL)

pdf('corForNonLinearPlots.pdf', 6, 2)

COL <- COL[1,2]
set.seed(1)

par(mfrow=c(1,3), mar=c(2.7, rep(0.5, 3)), mgp=c(1,0,0))

n <- 50
x <- c(runif(n[1]-2, -2, 2.2), 2, 2.1)
y <- -10*x^2 + rnorm(n[1], sd=5)
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlab='')
box()
mtext(paste('R =', round(cor(x,y), 2)), side=1, line=1, cex=1.1)

n <- 50
x <- c(runif(n[1]-2, -20, 10.2), 2, 2.1)
y <- -x^3 -10*x^2 + 100*x + rnorm(n[1], sd=120)
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlab='')
box()
mtext(paste('R =', round(cor(x,y), 2)), side=1, line=1, cex=1.1)

n <- 50
x <- runif(n[1], -1, 4)
y <- 0.25*(x>3) + -0.5*(x>2) + 1.7*(x>1) + (x<0)
x <- c(x,0,0,1,1)
y <- c(y,rep(0.5,2),rep(1,2)) + rnorm(n[1]+4, sd=0.071)
yR <- range(y) + c(-1,1)*0.1*diff(range(y))
plot(x,y, axes=FALSE, pch=20, col=COL[1], cex=1.351, xlab='', ylim=yR)
box()
mtext(paste('R =', format(c(round(cor(x,y), 2), 0.01))[1]), side=1, line=1, cex=1.1)

dev.off()