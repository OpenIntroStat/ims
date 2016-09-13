library(openintro)
data(COL)

myPDF('tDistDF18LeftTail2Point10.pdf', 4, 1.8, mar=c(1.6,1,0.1,1), mgp=c(5,0.45,0))
plot(c(-4, 4), c(0, dnorm(0)), type='n', axes=FALSE)
axis(1)
abline(h=0)

DF <- c('normal', 10, 5, 2, 1)

X <- seq(-5, 8, 0.01)
Y <- dt(X, 10)
lines(X, Y)

these <- which(X < -2.10)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col=COL[1])


dev.off()