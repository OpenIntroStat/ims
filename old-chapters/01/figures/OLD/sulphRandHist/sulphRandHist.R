histPlot <- function(x, col='#22558855', border='#225588', breaks="Sturges", probability=FALSE, axes=TRUE, ylab=NULL, xlab=NULL, las=1, xlim=NULL, ylim=NULL, returnPar=FALSE, outline=FALSE, add=FALSE, lty=2, lwd=1, ...){
    if(returnPar){
    	old.par <- par(no.readonly = TRUE)
    	on.exit(par(old.par))
	}
	if(is.list(x)){
		histPlotUtil(x, col, border, breaks,
			probability, axes, ylab, xlab, las,
			xlim, ylim, returnPar, outline, add,
			lty, lwd, ...)
		return(NULL)
	}
	H <- hist(x, breaks=breaks, plot=FALSE)
	br <- H$breaks
	mi <- H$mids
	y <- H$counts
	if(probability){
		y <- H$density
	}
	if(is.null(ylab)){
		ylab <- 'frequency'
		if(probability){
			ylab <- 'density'
		}
	}
	if(is.null(xlab)){
		xlab <- H$xname
	}
	if(is.null(xlim)){
		xlim <- range(br)
	}
	if(is.null(ylim)){
		ylim=c(0,max(y))
	}
	par(las=las)
	if(!add){
		plot(x, xlim=xlim, ylim=ylim, type='n', axes=FALSE, ylab=ylab, xlab=xlab)
		abline(h=0)
		if(axes){
			axis(1)
			axis(2)
		}
	}
	if(outline){
		n  <- length(H$breaks)
		br <- c(br[1], br)
		y  <- c(0, y, 0)
		points(br, y, type='s', col=border, lty=lty, lwd=lwd)
	} else {
		miL <- length(mi)
		for(i in 1:miL){
			rect(br[i], 0, br[i+1], y[i],
				border='#ffffff00', col=col)
			lines(rep(br[i],2), c(0,y[i]), col=border)
			lines(br[i:(i+1)], rep(y[i],2), col=border)
			if(i > 1){
				if(y[i] < y[i-1]){
					lines(rep(br[i],2), y[(i-1):i], col=border)
				}
			}
		}
		lines(rep(br[miL+1],2), c(0,y[miL]), col=border)
	}
}

histPlotUtil <- function(x, col, border, breaks, probability, axes, ylab, xlab, las, xlim, ylim, returnPar, outline, add, lty, lwd, ...){
	br <- x[[1]]
	mi <- apply(cbind(br[-1], br[-length(br)]), 1, mean)
	y <- x[[2]]
	if(probability){
		y <- y/sum(y)/(br[2]-br[1])
	}
	if(is.null(ylab)){
		ylab <- 'frequency'
		if(probability){
			ylab <- 'density'
		}
	}
	if(is.null(xlab)){
		xlab <- 'x'
	}
	if(is.null(xlim)){
		xlim <- range(br)
	}
	if(is.null(ylim)){
		ylim=c(0,max(y))
	}
	par(las=las)
	if(!add){
		plot(x, xlim=xlim, ylim=ylim, type='n', axes=FALSE, ylab=ylab, xlab=xlab)
		abline(h=0)
		if(axes){
			axis(1)
			axis(2)
		}
	}
	if(outline){
		n  <- length(br)
		br <- c(br[1], br)
		y  <- c(0, y, 0)
		points(br, y, type='s', col=border, lty=lty, lwd=lwd)
	} else {
		miL <- length(mi)
		for(i in 1:miL){
			rect(br[i], 0, br[i+1], y[i],
				border='#ffffff00', col=col)
			lines(rep(br[i],2), c(0,y[i]), col=border)
			lines(br[i:(i+1)], rep(y[i],2), col=border)
			if(i > 1){
				if(y[i] < y[i-1]){
					lines(rep(br[i],2), y[(i-1):i], col=border)
				}
			}
		}
		lines(rep(br[miL+1],2), c(0,y[miL]), col=border)
	}
	
}


require(UsingR)

library(Cairo)

CairoPDF('sulphRandHist.pdf', 1.1*6, 1.1*3.6)

set.seed(101)
trmt    <- c(rep('drug', 733), rep('placebo', 742))
outcome <- c(rep(c('lived', 'died'), c(692, 41)), rep(c('died', 'lived'), c(60, 682)))
diffs   <- do(100)(diff(prop.table(table(data.frame(sample(trmt), outcome)), margin=1))[1])
sum(diffs >= 0.02492)



par(mfrow=c(1,1), mar=c(3.6, 3.6, 1, 1), mgp=c(2.4, 0.7, 0), las=1)
plot(0,0, type='n', xlab='Difference in death rates', ylab='Frequency', xlim=c(-0.04, 0.05), ylim=c(0, 33), axes=FALSE)
abline(h = c(10, 20, 30, 50, 100, 150), col='#00000044', lty=3)
histPlot(diffs, xlab='Difference in death rates', ylab='Frequency', axes=FALSE, type='n', add=TRUE)
axis(1)
axis(2, at=c(0,10,20,30))
#axis(2, at=c(0,50,100,150))
abline(h=0)

dev.off()