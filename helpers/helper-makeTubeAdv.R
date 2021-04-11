makeTubeAdv <- function(x, y, Z=2, R=1, col='#00000022', border='#00000000', type=c('lin', 'quad', 'robust'), variance=c('constant', 'linear', 'other'), length.out=99, bw='default', plotTube=TRUE, ...){
	n <- length(x)
	r <- range(x)
	R <- abs(R)
	R <- r + c(-R,R)*diff(r)
	X <- seq(R[1], R[2], length.out=length.out)
	type <- type[1]
	if(type %in% c('l', 'L', 'lin', 'Lin', 'linear', 'Linear')){
		g <- lm(y ~ x)
		hold <- data.frame(x=X)
		Y <- predict(g, hold)
		S <- sd(g$residuals)
	} else if(type %in% c('q', 'quad', 'Q', 'Quad')){
		x2 <- x^2
		g <- lm(y ~ x + x2)
		hold <- data.frame(x=X, x2=X^2)
		Y <- predict(g, hold)
		S <- sd(g$residuals)
	} else if(type %in% c('r', 'R', 'robust', 'Robust')){
		if(bw[1] == 'default'){
			bw <- bw.nrd0(x)
		}
		Y <- rep(NA, length(X))
		for(i in 1:length(X)){
			if(min(x - X[i]) < 2*bw){
				temp <- dnorm(x-X[i], sd=bw)
				Y[i] <- sum(y*temp)/sum(temp)
			}
		}
		hold <- c()
		for(i in 1:length(y)){
			hold[i] <- Y[which.min(abs(X-x[i]))[1]]
		}
		S <- rep(sd(hold-y), length(Y))
	} else {
		stop('Argument "type" not recognized.\n')
	}
	variance <- variance[1]
	if(variance %in% c('o', 'O', 'other', 'Other')){
		if(bw[1] == 'default'){
			bw <- bw.nrd0(x)
		}
		S <- rep(NA, length(X))
		for(i in 1:length(X)){
			if(min(x - X[i]) < 2*bw){
				temp <- dnorm(x-X[i], sd=bw)
				if(sum(temp) > 2){
					wtdV <- sum(temp*(y-Y[i])^2)/(sum(temp)-1)
					S[i] <- sqrt(wtdV)
				}
			}
		}
		these <- !is.na(Y) & !is.na(S)
		X <- X[these]
		Y <- Y[these]
		S <- S[these]
	} else if(variance %in% c('L', 'l', 'linear', 'Linear')){
		if(bw[1] == 'default'){
			bw <- bw.nrd0(x)
		}
		S <- rep(NA, length(X))
		for(i in 1:length(X)){
			if(min(x - X[i]) < 2*bw){
				temp <- dnorm(x-X[i], sd=bw)
				if(sum(temp) > 2){
					wtdV <- sum(temp*(y-Y[i])^2)/(sum(temp)-1)
					S[i] <- sqrt(wtdV)
				}
			}
		}
		g <- lm(S ~ X)
		S <- predict(g, list(X=X))
		these <- !is.na(Y) & !is.na(S) & (S > 0)
		X <- X[these]
		Y <- Y[these]
		S <- S[these]
	} else if(!(variance %in% c('c', 'C', 'constant', 'Constant'))){
		stop('Did not recognize form of the "variance" argument.\n')
	}
	x <- c(X, rev(X))
	y <- c(Y-Z*S, rev(Y+Z*S))
	if(plotTube){
		polygon(x, y, border=border, col=col, ...)
	}
	invisible(list(x=x, y=y))
}



