library(openintro)
data(COL)

#===> plot <===#
myPDF("satAbove1630.pdf", 2.5, 1.3, mar=c(1.2,0,0.5,0), mgp=c(3,0.17,0))

X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-2,0,2), label=(1500+c(-2,0,2)*300), cex.axis=0.8)
these <- which(X >= 0.43)
polygon(c(X[these[1]], X[these],4), c(0,Y[these],0), col=COL[1])
#arrows(-0.1, 0.4*dnorm(0),(1600-1500)/300, dnorm(0)*.4, length=0.065)
#text(0.1, .4*dnorm(0), '1630', pos=2, cex=0.8)

#arrows(1.3,0.28, 0.43, 0.28, length=0.07)
#text(1.3, 0.28, 'X=1630\nZ=0.43', pos=4, cex=0.7)

lines(X, Y)
abline(h=0)

dev.off()