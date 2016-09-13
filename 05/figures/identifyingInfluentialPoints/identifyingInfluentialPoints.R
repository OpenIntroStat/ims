linResPlot <- function(x, y, axes=FALSE, wBox=TRUE, wLine=TRUE, lCol='#00000088', lty=1, lwd=1, xlab='', ylab='', marRes=NULL, col='#22558866', pch=20, cex=1.5, yR=0.1, ylim=NULL, subset=NULL, ...){
	if(is.null(ylim)[1]){
		YR <- range(y) + c(-1,1)*yR*diff(range(y))
	} else {
		YR <- ylim
	}
	plot(x, y, axes=axes, xlab='', ylab=ylab, col=col,
		pch=pch, cex=cex, ylim=YR, ...)
	if(wBox){
		box()
	}
	g <- lm(y ~ x, subset=subset)
	if(wLine){
		abline(g, col=lCol, lty=lty, lwd=lwd)
	}
	if(!is.null(marRes)[1]){
		par(mar=marRes)
	}
	X <- list(x=x)
	y <- y - predict(g, X)
	YR <- range(y) + c(-1,1)*yR*diff(range(y))
	plot(x,y, axes=axes, xlab=xlab, ylab='', col=col,
		pch=pch, cex=cex, ylim=YR, ...)
	if(wBox){
		box()
	}
	abline(h=0, lty=3, col=lCol)
}

pdf('identifyingInfluentialPoints.pdf', 7, 2.73)
myMat <- rbind(matrix(1:6,2))
myW <- c(1,1,1)
myH <- c(1,0.45)
layout(myMat, myW, myH)
COL <- c('#22558866', '#000000AA')
set.seed(1)

n <- c(95, 50, 78)
m <- c(-4, 12, 7)
xr <- list(2.16, -0.4, 1.42)
yr <- list(xr[[1]]*m[1], 1, 5.5)
ss <- list(1:(n[1]-1), 1:(n[2]-1), 1:(n[3]-3))
par(mar=c(0.35,0.654,0.35,0.654))
for(i in 1:3){
	x <- runif(n[i])
	y <- m[i]*x + rnorm(n[i])
	x <- c(x,xr[[i]])
	y <- c(y,yr[[i]])
	linResPlot(x,y,col=COL[1], subset=ss[[i]], yR=ifelse(i==1, 0.12, 0.44))
}

par(mar=c(0.25,0.25,0.25,0.25))

par(mar=c(0.25,0.25,0.25,0.25))


dev.off()