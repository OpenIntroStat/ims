

par(mfrow=c(1,2), mar=c(4,4,1,1), mgp=c(2.3, 0.7, 0))

col <- '#885533'
addNormal <- function(m, s, multFact, detail=200, ...){
	X <- seq(m-4*s, m+4*s, length.out=detail)
	Y <- multFact*dnorm(X, m, s)
	lines(X, Y, ...)
}

histPlot(possum$headL, xlab='headL (mm)', ylab='Frequency')
addNormal(mean(possum$headL), sd(possum$headL), 208, col=col, lty=2)
histPlot(marioKart$totalPr, xlab='totalPr (US$)', ylab='Frequency', xlim=c(20, 75))
addNormal(47, sd(marioKart$totalPr), 141*5, col=col, lty=2)

