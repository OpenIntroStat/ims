library(openintro)
data(COL)

#===> take sample <===#
d <- read.delim('150Births.txt')



pdf('distOfDiffOfSampleMeansForBWOfBabySmokeData.pdf', 4, 1.8)

par(las=1, mar=c(1.6,0,0,0), mgp=c(3,0.5,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=c(-5, 0, 1.54, 5), label=expression(0, mu[n]-mu[s]*' = 0', 'obs. diff', 0), cex.axis=0.9)
these <- which((X*0.26 >= 0.4))
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
these <- which((X*0.26 <= -0.4))
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])

lines(X, Y)
abline(h=0)


dev.off()