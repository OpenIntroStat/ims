library(openintro)
data(COL)

pdf('chiSquareAreaAbove4Point3WithDF2.pdf', 5, 3)
par(mar=c(2, 1, 1, 1), mgp=c(2.1, 0.8, 0), las=1)
x <- c(0, seq(0, 15, 0.05))
y <- c(0, dchisq(x[-1], 2))
plot(x, y, type='l', axes=FALSE)
abline(h=0)
axis(1)

these <- which(x > 4.3)
X <- x[c(these[1], these, rev(these)[1])]
Y <- c(0, y[these], 0)
polygon(X, Y, col=COL[1])

dev.off()