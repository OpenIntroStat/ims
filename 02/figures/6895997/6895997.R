library(openintro)
data(COL)

myPDF("6895997.pdf", 5, 2.5, mar=c(2,0,0,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='n', axes=F, ylim=c(0,0.4), xlim=c(-3.2,3.2))
abline(h=0, col=COL[6])
axis(1, at=-3:3, label=expression(mu-3*sigma,mu-2*sigma,mu-sigma,mu,
	mu+sigma,mu+2*sigma,mu+3*sigma))
ii <- c(1,2,3)
jj <- c(1,1,1)
for(i in 3:1){
	these <- (X>=i-1 & X <= i)
	polygon(c(i-1,X[these],i),c(0,Y[these],0), col=COL[ii[i],jj[i]], border=COL[ii[i],jj[i]])
	these <- (X>=-i & X <= -i+1)
	polygon(c(-i,X[these],-i+1),c(0,Y[these],0), col=COL[ii[i],jj[i]], border=COL[ii[i],jj[i]])
}
#lines(c(0,0),c(0,dnorm(0)), col='#888888')

#===> label 99.7 <===#
arrows(-3,0.03, 3,0.03, code=3, col='#444444', length=0.15)
#lines(c(-3,-3), c(0,0.03), lty=3, col='#888888')
#lines(c(3,3), c(0,0.03), lty=3, col='#888888')
text(0, 0.02, '99.7%', pos=3)

#===> label 95 <===#
arrows(-2,0.13, 2,0.13, code=3, col='#444444', length=0.15)
#lines(c(-2,-2), c(0,0.13), lty=3, col='#888888')
#lines(c(2,2), c(0,0.13), lty=3, col='#888888')
text(0, 0.12, '95%', pos=3)

#===> label 68 <===#
arrows(-1,0.23, 1,0.23, code=3, col='#444444', length=0.15)
#lines(c(-1,-1), c(0,0.23), lty=3, col='#888888')
#lines(c(1,1), c(0,0.23), lty=3, col='#888888')
text(0, 0.22, '68%', pos=3)

lines(X, Y, col='#888888')
abline(h=0, col='#AAAAAA')

dev.off()
