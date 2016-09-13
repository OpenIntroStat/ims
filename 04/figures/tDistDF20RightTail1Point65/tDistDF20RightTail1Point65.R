library(openintro)
data(COL)

myPDF('tDistDF20RightTail1Point65.pdf', 6.8, 1.9, mar=c(1.6,1,0.05,1), mgp=c(5,0.45,0), mfrow=c(1,2))
plot(c(-4, 4), c(0, dnorm(0)), type='n', axes=FALSE)
axis(1)
abline(h=0)

DF <- c('normal', 10, 5, 2, 1)

X <- seq(-5, 8, 0.01)
Y <- dt(X, 12)
lines(X, Y)

these <- which(X > 1.65)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col=COL[1])

plot(c(-4.5, 4.5), c(0, dnorm(0)), type='n', axes=FALSE)
axis(1)
abline(h=0)

DF <- c('normal', 10, 5, 2, 1)

X <- seq(-5, 8, 0.01)
Y <- dt(X, 2.3)
lines(X, Y)

these <- which(X > 3)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col=COL[1])

these <- which(X < -3)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col=COL[1])

dev.off()