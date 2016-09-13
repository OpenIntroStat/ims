library(openintro)
data(COL)

linResPlot <- function(x, y, axes=FALSE, wBox=TRUE, wLine=TRUE, lCol=COL[5], lty=1, lwd=1.5, xlab='', ylab='', marRes=NULL, col=COL[1,2], pch=20, cex=1.25, yR=0.1, ylim=NULL, subset=NULL, main="", ...){
	if(is.null(ylim)[1]){
		YR <- range(y) + c(-1,1)*yR*diff(range(y))
	} else {
		YR <- ylim
	}
	plot(x, y, axes=axes, xlab='', ylab=ylab, col=col,
		pch=pch, cex=cex, ylim=YR, main=main, ...)
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
	abline(h=0, lty=2, lwd=1, col=lCol)
}

pdf('outlierPlots.pdf', 7, 7)
myMat <- rbind(matrix(1:6,2),matrix(7:12,2))
myW <- c(1,1,1)
myH <- c(0.95,0.5,1,0.45)
layout(myMat, myW, myH)
set.seed(1)

n <- c(50, 25, 78, 55, 70, 150)
m <- c(12, -4, 7, -19, 0, 40)
xr <- list(0.3, c(2), 1.42,
	runif(4,1.45,1.55), 5.78, -0.6)
yr <- list(-4, c(-8), 19,
	c(-17,-20,-21,-19), 12, -23.2)
for(i in 1:3){
	par(mar=c(0.25,0.5,1.75,0.5))
	x <- runif(n[i])
	y <- m[i]*x + rnorm(n[i])
	x <- c(x,xr[[i]])
	y <- c(y,yr[[i]])
	linResPlot(x,y,col=COL[1,2],marRes=c(4,2,1,2)/4, yR=0.13,
				main=paste("(", i, ")", sep=""))
}
for(i in 4:6){
	par(mar=c(0.25,0.5,1.75,0.5))
	x <- runif(n[i])
	y <- m[i]*x + rnorm(n[i])
	x <- c(x,xr[[i]])
	y <- c(y,yr[[i]])
	linResPlot(x,y,col=COL[1,2],marRes=c(1,2,1,2)/4,
				yR=ifelse(i==4,c(0.5,0.1),0.1),
				main=paste("(", i, ")", sep=""))
}

par(mar=c(0.25,0.25,0.25,0.25))

par(mar=c(0.25,0.25,0.25,0.25))


dev.off()