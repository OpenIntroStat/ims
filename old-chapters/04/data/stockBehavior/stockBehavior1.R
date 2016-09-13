library(openintro)
library(stockPortfolio)
d <- getReturns("^GSPC", freq='d', start='1990-01-01', end='2009-12-31')
R <- rev(d$R[,1])

s <- c()
si <- TRUE
k  <- 1
n  <- 0
for(i in 2:length(R)){
	if((R[i] == 0)){
		k <- k+1
	} else if((R[i] > 0) != si){
		n  <- n+1
		s[n] <- k
		k  <- 1
		si <- !si
	} else {
		k <- k+1
	}
}

sHold <- s
sum(s == 1)
sum(s == 2)
sum(s == 3)
sum(s == 4)
sum(s == 5)
sum(s == 6)
sum(s >= 7)


histPlot(sHold-0.51, ylim=c(0, 3000), breaks=seq(0, 15, 0.5))

R <- sample(R)
s <- c()
si <- TRUE
k  <- 1
n  <- 0
for(i in 2:length(R)){
	if((R[i] > 0) != si){
		n  <- n+1
		s[n] <- k
		k  <- 1
		si <- !si
	} else {
		k <- k+1
	}
}
histPlot(s-0.01, add=TRUE, breaks=seq(0, 18, 0.5), col='#22558833')