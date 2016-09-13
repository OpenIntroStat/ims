library(openintro)
data(COL)

#===> plot <===#
myPDF("simpleNormal.pdf", 4, 1.65, mfrow=c(1,1), las=1, mar=0.5*c(1,1,1,1))

# curve 1
X <- seq(-5,5,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-4,4), lwd=2, col=COL[5])
#axis(1, at=-3:3)
abline(h=-0.002, col=COL[5])
dev.off()