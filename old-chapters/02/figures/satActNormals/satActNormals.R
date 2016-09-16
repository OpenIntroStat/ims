library(openintro)
data(COL)

pdf('satActNormals.pdf', 5, 5)

set.seed(1)
#===> plot <===#
par(mfrow=c(2,1), las=1, mar=c(2.5,0,0.5,0))

# curve 1
m <- 1500
s <- 300
X <- m+s*seq(-4,4,0.01)
Y <- dnorm(X, m, s)
plot(X, Y, type='l', axes=F, xlim=m+s*c(-2.7,2.7))
axis(1, at=m+s*(-3:3))
abline(h=0)
lines(c(m,m), dnorm(m, m, s)*c(0.01,0.99), lty=2, col='#EEEEEE')
lines(c(m,m)+s, dnorm(m+s, m, s)*c(0.01,1.25), lty=2, col=COL[1])
text(m+s, dnorm(m+s,m,s)*1.25, 'Ann', pos=3, col=COL[1])


# curve 2
par(mar=c(2,0,1,0))
m <- 21
s <- 5
X <- m+s*seq(-4,4,0.01)
Y <- dnorm(X, m, s)
plot(X, Y, type='l', axes=F, xlim=m+s*c(-2.7,2.7))
axis(1, at=m+s*(-3:3))
abline(h=0)
lines(c(m,m), dnorm(m, m, s)*c(0.01,0.99), lty=2, col='#EEEEEE')
lines(c(m,m)+3, dnorm(m+3, m, s)*c(0.01,1.2), lty=2, col=COL[1])
text(m+3, dnorm(m+3,m,s)*1.05, 'Tom', pos=4, col=COL[1])

dev.off()
