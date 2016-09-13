makeTube <- function(x, y, Z=2, R=1, col='#00000022', border='#00000000', type=c('lin', 'quad', 'robust'), homosk=TRUE, length.out=99, bw='default', plotTube=TRUE, addLine=TRUE, ...){
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
	if(!homosk){
		if(bw[1] == 'default'){
			bw <- bw.nrd0(x)
		}
		S <- rep(NA, length(X))
		for(i in 1:length(X)){
			if(min(abs(x - X[i])) < 2*bw){
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
	}
	x <- c(X, rev(X))
	y <- c(Y-Z*S, rev(Y+Z*S))
	if(plotTube){
		polygon(x, y, border=border, col=col, ...)
	}
	if(addLine){
		lines(X, Y)
	}
	invisible(list(X=X, Y=Y, x=x, y=y))
}



