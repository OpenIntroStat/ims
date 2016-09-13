library(openintro)
data(COL)

probDist <- function(x, prob, labels1=NA,
		labels2=NA, thickness=NA, col=NA, ylim=NULL, ...){
	R <- range(x)
	R <- R + c(-1,1)*(R[2]-R[1])/20
	Ry <- c(0, range(prob)[2])
	if(!is.null(ylim)[1]){
		Ry <- ylim
	}
	plot(x, prob, type='n', axes=F, xlim=R, ylim=Ry, ...)
	if(is.na(labels1)[1]) labels1 <- x
	if(is.na(labels2)[1]) labels2 <- TRUE
	axis(1, at=x, labels=labels1)
	#axis(2)
	make.bar(x, prob, thickness=thickness, col=col)
	#abline(h=0)
}

make.bar <- function(at, height, thickness=NA, col=NA){
	if(is.na(thickness)){
		R <- range(at)
		minDiff <- min(diff(at))
		thickness <- min(c(minDiff), (R[2]-R[1])/12)
	}
	x1 <- at - thickness/2
	x2 <- at + thickness/2
	if(is.na(col))   col <- 'grey'
	for(i in 1:length(at)){
#		x <- c(x1[i], x1[i], x2[i], x2[i], x2[i])
#		y <- c(0, height[i], height[i], 0, 0)
		rect(x1[i], 0, x2[i], height[i], col=col)
	}
}

pdf('bookCostDist.pdf', 5, 3)
at <- c(0, 137, 170)
prob <- c(0.2, .55, .25)

# must load probDist
par(las=1, mar=c(3.2,4,0.5,0.5), mgp=c(2, 0.7, 0))
probDist(at, prob, xlab='cost (dollars)', ylab='', ylim=c(-0.02, 0.55), col=COL[1])
axis(2, at=seq(0,0.5, 0.1))
lines(c(-10, 180), c(0,0))
polygon(117.85 + c(-17, 17, 0), c(-0.08, -0.08, 0), col=COL[4])
par(las=0)
mtext('probability', side=2, line=2.8)
dev.off()