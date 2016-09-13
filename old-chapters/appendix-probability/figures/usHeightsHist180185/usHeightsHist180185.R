library(openintro)
data(COL)
load("../fdicHistograms/fdicHistograms.rda")
#===> load in the data set from fdicHistograms <===#

BR      <- list()
MIDS    <- br[-1]-0.25
BR[[1]] <- seq(110, 210, 10)
BR[[2]] <- seq(115, 210, 2.5)
COUNTS  <- list()
for(i in 1:2){
	COUNTS[[i]] <- rep(0, length(BR[[i]])-1)
	for(j in 1:(length(BR[[i]])-1)){
		these <- apply(cbind(MIDS < BR[[i]][j+1], MIDS >= BR[[i]][j]), 1, all)
		if(any(these)){
			COUNTS[[i]][j] <- sum(counts[these])
		}
	}
}

histTemp <- function(BR, COUNTS, col=fadeColor(COL[1], "10"), border=COL[1,4], probability=FALSE, xlab='', ylab=NULL, xlim=NULL, ylim=NULL, ...){
	br <- BR
	h  <- COUNTS
	if(probability){
		h <- h/sum(h)/diff(br)
	}
	if(is.null(ylab)){
		ylab <- 'frequency'
		if(probability){
			ylab <- 'probability'
		}
	}
	if(is.null(xlim)[1]){
		xR <- range(br)
		xlim <- xR + c(-0.05, 0.05)*diff(xR)
	}
	if(is.null(ylim)[1]){
		ylim <- range(c(0,h))
	}
#	cat()
	plot(-1, -1, xlab=xlab, ylab=ylab, xlim=xlim, ylim=ylim, type='n', ...)
	abline(h=0)
	lines(c(br[1],br[1]), c(0,h[1]), col=border)
	for(i in 1:length(h)){
		if(i > 1){
			if(h[i] > h[i-1]){
				lines(rep(br[i],2), h[c(i-1,i)], col=border)
			}
		}
		lines(br[i+0:1], rep(h[i],2), col=border)
		lines(rep(br[i+1],2), c(0,h[i]), col=border)
		rect(br[i], 0, br[i+1], h[i], col=col, border='#00000000')
	}
}


myPDF('usHeightsHist180185.pdf', 6*1.15, 2.75*1.15, mfrow=c(1,1), mar=c(3, 1, 0.1, 1), mgp=c(1.8, 0.7, 0))
histTemp(BR[[2]], COUNTS[[2]], xlim=c(125, 210), axes=FALSE, xlab='height (cm)', probability=FALSE)
lines(BR[[i]], c(COUNTS[[i]],0), type='s', col=COL[1], lwd=2)
axis(1)
rect(BR[[2]][27], 0, BR[[2]][28], COUNTS[[2]][27], col=COL[1], border=COL[1])
rect(BR[[2]][28], 0, BR[[2]][29], COUNTS[[2]][28], col=COL[1], border=COL[1])
dev.off()