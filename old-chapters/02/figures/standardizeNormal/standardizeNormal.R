
x <- rnorm(10000, 7, 2)
t <- list()
t[[1]] <- hist(x, breaks=12)
t[[2]] <- hist(x-7, breaks=12)
t[[3]] <- hist((x-7)/2, breaks=12)
COL <- c('#DDEEFF', '#CCDDBB', '#AA8899')
BCOL <- c('#D4E4F4', '#99C969', '#410111')
aCOL <- c('#999999', '#444444')
L <- 0.05

makeHist <- function(t, j=1, col=COL, border=BCOL){
	for(i in 1:length(t[[j]]$counts)){
		rect(t[[j]]$breaks[i], 0, t[[j]]$breaks[i+1], t[[j]]$density[i],
			 border=border[j], col=COL[j])
	}
}


#===> for 2 plots, stacked <===#
par(mfrow=c(2,1), mar=c(3,0,2,0))
plot(0,0,type='n', xlab='', ylab='', xlim=c(-13,13), axes=F, ylim=c(0,dnorm(0))/1.5)
title('moving the mean', cex.main=0.9, col.main='#444444')
abline(h=0, col='#666666')
axis(1, at=c(0,7), label=c(0,7), col.axis=BCOL[1])
axis(1, at=c(0), label=0, col.axis=BCOL[2])
arrows(4.3,0.125, 2.7,0.125, col=aCOL[1], length=L)
makeHist(t,1)
makeHist(t,2)
x0 <- seq(-7,7,0.01)
y0 <- dnorm(x0, 0, 2)
lines(x0+7,y0, col=BCOL[1])
lines(x0,y0, col=BCOL[2])

plot(0,0,type='n', xlab='', ylab='', xlim=c(-6,6), ylim=c(0,dnorm(0)), axes=F)
title('decreasing the standard deviation', cex.main=0.75, col.main='#444444')
abline(h=0, col='#666666')
lines(c(0,0),c(0,dnorm(0)),col='#D8D8D8', lty=3)
axis(1, at=c(2), label=expression(2), col.axis=BCOL[2])
axis(1, at=c(-20, 0, 20), label=expression(,0,), col.axis=aCOL[2])
axis(1, at=c(-20, 1, 20), label=expression(,1,), col.axis=BCOL[3])
makeHist(t,2)
makeHist(t,3)
x0 <- seq(-7,7,0.01)
y0 <- dnorm(x0, 0, 2)
lines(x0,y0, col=BCOL[2])
lines(x0/2,y0*2, col=BCOL[3])
arrows(4.5,y0[x0==3], 3,y0[x0==3], col=aCOL[2], length=0.05)
arrows(-4.5,y0[x0==3], -3,y0[x0==3], col=aCOL[2], length=0.05)

#===> for a single plot <===#
#par(mfrow=c(1,1), mar=c(2.5,0,1.5,0))
#plot(0,0,type='n', xlab='', ylab='', xlim=c(-13,13), axes=F, ylim=c(0,dnorm(0)))
#title('moving the mean', cex.main=0.9, col.main='#444444')
#abline(h=0, col='#666666')
#axis(1, at=c(-7, 0, 7), label=c(-7, 0, 7))
#makeHist(t,1)
#makeHist(t,2)
#makeHist(t,3)

