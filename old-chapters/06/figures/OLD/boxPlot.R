`boxPlot` <-
function(x, fact=NULL, horiz=FALSE, width=2/3, lwd=1, lcol='black', medianLwd=2, pch=20, pchCex=1.8, col=fadeColor('black', '44'), add=FALSE, at=NULL, key=NULL, axes=TRUE, xlab='', ylab='', xlim=NULL, ylim=NULL, ...){
	if(length(add) > 1){
		at  <- add
		add <- TRUE
	}
	
	if(add && is.null(fact)[1]){
	#=====> Add Box Plot <=====#
		
		
		
		
	} else if(add) {
	#=====> Add Each Factor <=====#
		
		
		
		
	} else {
	#=====> Prepare Plot <=====#
		
		# Limits
		
		
		# Create at if necessary
		
		
		# Create key if necessary
		
		
		plot(0, type="n", xlim=xR, ylim=yR, xlab=xlab, ylab=ylab, axes=FALSE, ...)
		if(axes){
			if(horiz){
				axis(1)
				axis(2, at, key)
			} else {
				axis(1, at, key)
				axis(2)
			}
		}
		
		boxPlot(x=x, fact=fact, horiz=horiz, width=width, lwd=lwd,
				lcol=lcol, medianLwd=medianLwd, pch=pch, pchCex=pchCex,
				col=col, add=TRUE, at=at, key=key, axes=FALSE) 
	}
	
	if(!is.null(fact)[1]){
		fact <- as.character(fact)
	} else {
		fact <- rep('', length(x))
	}
	if(is.null(key)[1]){
		uFact <- sort(unique(fact))
	} else {
		uFact <- key
	}
	xlNull <- FALSE
	ylNull <- FALSE
	if(is.null(xlim)[1]){
		xR     <- c(1-2*w,N+2*w)
		xlNull <- TRUE
	} else {
		xR.    <- c(1-2*w,N+2*w)
		xR     <- xlim
	}
	if(is.null(ylim)[1]){
		yR     <- range(x)
		yR     <- yR + c(-1,1)*diff(yR)/30
		ylNull <- TRUE
	} else {
		yR     <- range(x)
		yR.    <- yR + c(-1,1)*diff(yR)/30
		yR     <- ylim
	}
	if(horiz){
		if(xlNULL){
			yR <- xR.
		}
		if(ylNULL){
			xR <- yR.
		}
	}
	if(!add){
		plot(0, 0, type="n", xlim=xR, ylim=yR, xlab=xlab, ylab=ylab, axes=FALSE, ...)
	}
	if(nFact > 1){
		for(i in 1:nFact){
			
		}
	}
	
	
	
	
	
	
	
	
		if(is.null(ylim)){
			yR <- c(1-2*w,N+2*w)
		} else {
			yR <- ylim
		}
		if(is.null(xlim)){
		} else {
			xR <- xlim
		}
	N <- length(uFact)
	fiveNum <- matrix(NA, N, 5)
	for(i in 1:N){
		fiveNum[i,] <- fivenum(x[fact == uFact[i]])
	}
	iqrAdj <- 1.5*(fiveNum[,4] - fiveNum[,2])
	below <- which(fiveNum[,1] < fiveNum[,2]-iqrAdj)
	if(length(below) > 0){
		for(i in 1:length(below)){
			fiveNum[below[i],1] <- min(x[x > fiveNum[below[i],2]-iqrAdj[below[i]] & fact == uFact[i]])
		}
	}
	above <- which(fiveNum[,5] > fiveNum[,4]+iqrAdj)
	if(length(above) > 0){
		for(i in 1:length(above)){
			fiveNum[above[i],5] <- max(x[x < fiveNum[above[i],4]+iqrAdj[above[i]] & fact == uFact[i]])
		}
	}
#	below <- fiveNum[,1] < fiveNum[,2]-iqrAdj
#	fiveNum[below,1] <- fiveNum[below,2]-iqrAdj[below]
#	above <- fiveNum[,5] > fiveNum[,4]+iqrAdj
#	fiveNum[above,5] <- fiveNum[above,4]+iqrAdj[above]
	w <- width/2
	if(horiz){
		if(is.null(ylim)){
			yR <- c(1-2*w,N+2*w)
		} else {
			yR <- ylim
		}
		if(is.null(xlim)){
			xR <- range(x)
			xR <- xR + c(-1,1)*diff(xR)/30
		} else {
			xR <- xlim
		}
		if(is.logical(add[1])){
			if(!add[1]){
				plot(1:length(x),x,type='n',axes=FALSE, xlim=xR, xlab=xlab, ylab=ylab, ylim=yR, ...)
			}
			add <- 1:N
		} 
		if(N == 1){
			w <- w/1.3
		}
		for(i in 1:N){
			bds <- add[i]+w*c(-1,1)
			lines(rep(fiveNum[i,1],2), bds, col=lcol, lwd=lwd)
			lines(fiveNum[i,1:2], c(add[i],add[i]), col=lcol, lwd=lwd)
			rect(fiveNum[i,2], add[i]-w, fiveNum[i,4], add[i]+w, border=lcol, lwd=lwd)
			lines(rep(fiveNum[i,3], 2), bds, col=lcol, lwd=medianLwd)
			lines(fiveNum[i,4:5], c(add[i],add[i]), col=lcol, lwd=lwd)
			lines(rep(fiveNum[i,5],2), bds, col=lcol, lwd=lwd)
			if(i %in% above){
				X <- x[fact == uFact[i] & x > fiveNum[i,5]]
				points(X, rep(add[i], length(X)), pch=pch, col=col, cex=pchCex)
			}
			if(i %in% below){
				X <- x[fact == uFact[i] & x < fiveNum[i,1]]
				points(X, rep(add[i], length(X)), pch=pch, col=col, cex=pchCex)
			}
		}
		if(axes){
			if(N > 1){
				axis(2, at=add, labels=uFact)
			}
			axis(1)
			box()
		}
	} else {
		if(is.null(ylim)){
			yR <- range(x)
			yR <- yR + c(-1,1)*diff(yR)/30
		} else {
			yR <- ylim
		}
		if(is.null(xlim)){
			xR <- c(1-2*w,N+2*w)
		} else {
			xR <- xlim
		}
		if(is.logical(add[1])){
			if(!add[1]){
				plot(1:length(x),x,type='n',axes=FALSE, xlim=xR, xlab=xlab, ylab=ylab, ylim=yR, ...)
			}
			add <- 1:N
		}
		if(N == 1){
			w <- w/1.3
		}
		for(i in 1:N){
			bds <- add[i]+w*c(-1,1)
			lines(bds, rep(fiveNum[i,1],2), col=lcol, lwd=lwd)
			lines(c(add[i],add[i]), fiveNum[i,1:2], col=lcol, lwd=lwd)
			rect(add[i]-w, fiveNum[i,2], add[i]+w, fiveNum[i,4], border=lcol, lwd=lwd)
			lines(bds, rep(fiveNum[i,3], 2), col=lcol, lwd=medianLwd)
			lines(c(add[i],add[i]), fiveNum[i,4:5], col=lcol, lwd=lwd)
			lines(bds, rep(fiveNum[i,5],2), col=lcol, lwd=lwd)
			if(i %in% above){
				X <- x[fact == uFact[i] & x > fiveNum[i,5]]
				points(rep(add[i], length(X)), X, pch=pch, col=col, cex=pchCex)
			}
			if(i %in% below){
				X <- x[fact == uFact[i] & x < fiveNum[i,1]]
				points(rep(add[i], length(X)), X, pch=pch, col=col, cex=pchCex)
			}
		}
		if(axes){
			if(N > 1){
				axis(1, at=add, labels=uFact)
			}
			axis(2)
			box()
		}
	}
}

