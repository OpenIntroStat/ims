library(openintro)
data(COL)

plotWLine <- function(x,y,xlab='', ylab='',col=COL[1],cex=1.7,pch=20,n=4,nMax=5, yR=0.1, ...){
	par(las=0)
	yR <- range(y) + c(-1,1)*0.1*diff(range(y))
	plot(x,y, axes=FALSE, pch=20, cex=1.7, col=COL[1], xlab='', ylab='',ylim=yR,...)
	buildAxis(1,x,n,nMax=nMax)
	mtext(xlab, 1, 1.8)
	mtext(ylab, 2, 2.3)
	par(mgp=c(2.8,0.75,0), las=1)
	buildAxis(2,y,n,nMax=nMax)
	g <- lm(y ~ x)
#	abline(g, col='#00000088', lwd=2, lty=2)
	abline(g, col=COL[4])
}


set.seed(3)
pdf('notGoodAtAllForALinearModel.pdf', 6.4, 3*6.4/7)
#layout(matrix(c(1,2), ncol=1), 1, c(1.5,1))
par(mar=c(3,3.5,1,2), mgp=c(1.9,0.6,0))
theta <- seq(0, pi/2, length.out=25)
v <- 12
x <- 2*v^2*sin(theta)*cos(theta)/9.8 + rnorm(length(theta), sd=0)
plotWLine(theta/pi*2*90,x, xlab='Angle of incline (degrees)', ylab='Distance traveled (m)')
abline(h=0)
text(mean(theta/pi*2*90), mean(x), 'Best fitting straight line is flat (!)', pos=1, col=COL[4])
par(mar=rep(0,4))
theta <- pi/6
t <- seq(0,2*v/9.8*sin(theta),length.out=15)
x <- v*t*cos(theta)
y <- -0.5*9.8*t^2 + v*sin(theta)*t
#plot(x,y,xlab='',ylab='', xlim=range(x)+c(-2,0.5)*3, ylim=range(y) + c(-1.3,0.5)*.5, axes=FALSE)
#arrows(0, -0.3, x[15], -0.3, length=0.1, code=3)
abline(h=0)
dev.off()