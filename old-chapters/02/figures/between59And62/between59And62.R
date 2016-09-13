library(openintro)
data(COL)

pdf('between59And62.pdf', 2.5, 1.3)
#===> plot <===#
par(las=1, mar=c(1.5,0,0.5,0), mgp=c(3,0.45,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-2,0,2), label=round(70+3.3*c(-2,0,2),2), cex.axis=0.8)
these <- which(X >= -.3 & X < 1.21)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])

#text(-.95, 0.08, '0.3821', cex=0.7)

#arrows(1.75,0.14, 1.75, 0.03, length=0.07)
#text(2, 0.14, '0.1131', cex=0.8, pos=3)

lines(X, Y)
abline(h=0)

dev.off()