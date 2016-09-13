library(openintro)
data(COL)

myPDF('height82Perc.pdf', 2.15, 1.13, las=1, mar=c(1.31,0,0.01,0), mgp=c(3,0.45,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-2,0,2), label=round(70+3.3*c(-2,0,2),2), cex.axis=0.8)
these <- which(X <= 0.92)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])

text(-2, 0.23, '  82%\n(0.82)', cex=0.8, col=COL[1])

arrows(2,0.22, 1.45, 0.07, length=0.07)
text(2.1, 0.2, '  18%\n(0.18)', cex=0.8, pos=3)

lines(X, Y)
abline(h=0)
dev.off()