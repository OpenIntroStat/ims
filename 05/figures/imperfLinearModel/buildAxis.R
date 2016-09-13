`buildAxis` <- function(side, limits, n, nMin=2, nMax=10, extend=2, eps=10^-12, ...){
	if(!all(is.finite(limits))){
		stop("Must provide finite limits.\n")
	}
	limits <- range(limits)
	if(limits[1] == limits[2]){
		stop('Range of "limits" is too small. Scale the data.\n')
	}
	
	L <- limits
	l <- L + c(-1,1)*diff(L)*extend
	s <- sign(l)
	l10 <- round(log10(abs(l)))
	d   <- diff(l)
	d10 <- round(log10(d))
	
	L1 <- L
	temp <- round(L1[1]/10^(d10))
	L <- L1 - 10^(d10)*temp
	Lup <- temp*10^(d10)
	l1 <- l
#	temp <- round(l1[1]/10^(d10))
	l <- l1 - 10^(d10)*temp
	lup <- temp*10^(d10)
	
	si <- list()
	si[[1]] <- seq(-6, 5, 0.01)/10
	si[[2]] <- seq(-6, 5, 0.015)/10
	si[[3]] <- seq(-6, 5, 0.02)/10
	si[[4]] <- seq(-6, 5, 0.025)/10
	si[[5]] <- seq(-6, 5, 0.03)/10

	si[[6]]  <- seq(-6, 5, 0.04)/10
	si[[7]]  <- seq(-6, 5, 0.05)/10
	si[[8]]  <- seq(-6, 5, 0.06)/10
	si[[9]]  <- seq(-7, 5, 0.07)/10
	si[[10]] <- seq(-6, 5, 0.08)/10
	
	AES <- c(8, 0, 7, 5, 3,
			 4, 7, 2, 1, 2)
	for(i in 0:2){
		for(j in 1:10){
			temp <- round(10000*si[[j]]*10^i)/10000
			si[[i*10+j]] <- temp
			AES[i*10+j]  <- AES[j]
		}
	}
	
	if(0 >= L[1] && 0 <= L[2]){
		start <- 0
	} else {
		start <- -10^max(round(log10(abs(L))+0.5))
		go <- rep(TRUE, 2)
		temp <- 10^max(round(log10(abs(L))-0.5))
		while(all(go)){
			go <- FALSE
			if(start < L[1]){
				start <- start + temp
				go <- TRUE
			}
		}
	}
	
	br <- list()
	se <- list()
	ss <- list()
	le <- c()
	for(i in 1:length(si)){
		br[[i]] <- si[[i]]*10^d10
		se[[i]] <- start + br[[i]]
		these   <- (se[[i]] <= l[2]+eps) &
					(se[[i]] >= l[1]-eps)
		ss[[i]] <- se[[i]][these]
		these   <- (se[[i]] <= L[2]+eps) &
					(se[[i]] >= L[1]-eps)
		le[i]   <- sum(these)
		ss[[i]] <- ss[[i]] + Lup
	}
	L <- L1
	l <- l1
	
	these <- which(le >= nMin & le <= nMax)
	aes <- c()
	for(i in these){
		min((ss[[i]][ss[[i]]>L[1]] - L[1])/d)
		min((L[1] - ss[[i]][ss[[i]]<L[1]])/d)
		abs(n-le[[i]])
		temp <- ss[[i]][ss[[i]]>L[1]] - L[1]
		temp1  <- -log(max(c(0.01, min(temp/d))), 5)
		temp <- L[1] - ss[[i]][ss[[i]]<L[1]]
		temp2  <- -log(max(c(0.01, min(temp/d))), 5)
		temp3  <- -abs(le[i]-n)^2/(n+1)
		AES[i] <- AES[i] + temp1 + temp2 + temp3
	}
	select <- which.max(AES[these])[1]
	
	l <- ss[[these[select]]]
	
	temp   <- -round(log10(eps))
	l <- (round(l*10^temp))*10^(-temp)
	axis(side, at=l, ...)
	invisible(l)
}

