library(openintro)
data(COL)

myPDF('pValueOfTwoTailAreaOfExamVersionsWhereDFIs26.pdf', 4.8, 1.9, mar=c(1.6, 1, 0.2, 1), mgp=c(0, 0.45, 0), las=1)
plot(0, 0, type='n', xlab='', ylab='', axes=FALSE, xlim=c(-3.5, 3.5), ylim=c(0, 0.4))
X <- seq(-4, 4, 0.01)
Y <- dt(X, 26)
lines(X, Y)
abline(h=0)
axis(1, cex.axis=0.9)
these <- which(X > 1.15)
X <- X[c(these[1], these, rev(these)[1])]
Y <- c(0, Y[these], 0)
polygon(X, Y, col=COL[1])
X <- seq(-4, 4, 0.01)
Y <- dt(X, 26)
these <- which(X < -1.15)
X <- X[c(these[1], these, rev(these)[1])]
Y <- c(0, Y[these], 0)
polygon(X, Y, col=COL[1])

lines(c(1.16, 1.16), c(dt(1.16, 26), 0.25), lty=3, cex=2)
text(1.46, 0.24, "T = 1.15", pos=3, cex=0.8)


dev.off()