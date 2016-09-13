library(openintro)
data(COL)

set.seed(1)

x <- rnorm(100000)
hold <- hist(x, breaks=50, probability=TRUE, type="n", plot=FALSE)

#===> plot <===#
myPDF("twoSampleNormals.pdf", 6, 2, mfrow=c(1,2), las=1, mar=c(2.5,1,0.5,1))

# curve 1
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
axis(1, at=-3:3)
for(i in 1:length(hold$counts)){
	rect(hold$breaks[i], 0, hold$breaks[i+1], hold$density[i],
		border=COL[5,4], col=COL[7,3])
}
lines(X, Y)
abline(h=0)

# curve 2
X <- seq(3,35,0.01)
Y <- dnorm(X, 19, 4)
plot(X, Y, type='l', axes=F, xlim=c(5.4,32.6))
axis(1, at=19+4*(-3:3))

for(i in 1:length(hold$counts)){
	rect(19+4*hold$breaks[i], 0, 19+4*hold$breaks[i+1], hold$density[i]/4,
		border=COL[5,4], col=COL[7,3])
}
lines(X, Y)
abline(h=0)

dev.off()
