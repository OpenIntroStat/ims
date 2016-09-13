library(openintro)
data(COL)

myPDF('pValueShownForSATHTOfOver100PtGain.pdf', 4, 2, mar=c(1.5, 1, 0.2, 1), mgp=c(0, 0.45, 0), las=1)
plot(0, 0, type='n', xlab='', ylab='', axes=FALSE, xlim=c(-3.5, 3.5), ylim=c(0, 0.4))
X <- seq(-4, 4, 0.01)
Y <- dt(X, 20) # 29)
lines(X, Y)
abline(h=0)
axis(1, cex.axis=0.9)
these <- which(X > 2.39)
X <- X[c(these[1], these, rev(these)[1])]
Y <- c(0, Y[these], 0)

lines(c(2.4, 2.4), c(dt(2.4, 20), 0.1), lty=3, lwd=2)
text(2.73, 0.088, "T = 2.39", pos=3, cex=0.8)


polygon(X, Y, col=COL[1])


dev.off()