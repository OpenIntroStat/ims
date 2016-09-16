library(openintro)
data(COL)

myPDF('jurorHTPValueShown.pdf', 4*1.1, 1.7*1.1, mar=c(1.5, 1, 0.2, 1), mgp=c(2.1, 0.45, 0), las=1)
x <- seq(0, 35, 0.05)
y <- dchisq(x, 3) #*1:length(x)
plot(x, y, type='l', axes=FALSE, xlim=c(0, 16))
abline(h=0)
axis(1)

these <- which(x > 5.89)
X <- x[c(these[1], these, rev(these)[1])]
Y <- c(0, y[these], 0)
polygon(X, Y, col=COL[1])

dev.off()