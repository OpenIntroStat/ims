library(openintro)
data(COL)

pdf('tDistConvergeToNormalDist.pdf', 1.1*5.4, 1.1*2.3)

par(mar=c(2, 1, 1, 1), mgp=c(5, 0.6, 0))
plot(c(-3.5, 8), c(0, dnorm(0)), type='n', axes=FALSE)
axis(1)
abline(h=0)

COL. <- fadeColor(COL[1], c("FF", "89", "68", "4C", "33"))
COLt <- fadeColor(COL[1], c("FF", "AA", "85", "60", "45"))
DF   <- c('normal', 8, 4, 2, 1)

X <- seq(-5, 10, 0.02)
Y <- dnorm(X)
lines(X, Y, col=COL.[1])

for(i in 2:5){
	Y <- dt(X, as.numeric(DF[i]))
	lines(X, Y, col=COL.[i])
}

legend(4.5, 0.4, legend=c(DF[1], paste('t, df=', DF[2:5], sep='')), col=COL., text.col=COLt, lty=rep(1, 5))

dev.off()
