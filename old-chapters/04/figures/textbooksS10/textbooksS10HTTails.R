library(openintro)
data(textbooks)
data(COL)

d <- textbooks

pdf('textbooksS10HTTails.pdf', 5, 2)

par(las=1, mar=c(1.7,0,0.5,0), mgp=c(3,0.5,0))
X <- seq(-9,9,0.01)
Y <- dt(X, 20)
plot(X, Y, type='l', axes=FALSE, xlim=c(-8,8))
axis(1, at=c(-10, 0, 6.5, 10), label=expression(0, mu[0]*' = 0', bar(x)[diff]*" = 12.76", 0), cex.axis=0.9)

lines(X, Y, lwd=1.5)
abline(h=0)
these <- which(X >= 6.5)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[4,2], border=COL[4,2], lwd=4)
these <- which(X <= -6.5)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[4,2], border=COL[4,2], lwd=4)

#arrows(7, 0.1, 7, 0.015, length=0.08)
arrows(7, 0.1, 7, 0.015, length=0.08, col=COL[4])
text(7, 0.1, "right tail", pos=3, col=COL[4])
#arrows(-7, 0.1, -7, 0.015, length=0.08)
arrows(-7, 0.1, -7, 0.015, length=0.08, col=COL[4])
text(-7, 0.1, "left tail", pos=3, col=COL[4])


dev.off()