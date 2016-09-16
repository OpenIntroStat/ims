
x <- rnorm(100000)
hold <- hist(x, breaks=50, prob=T)

#===> plot <===#
par(las=1, mar=c(2.5,0,0.5,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4))
#axis(1, at=-3:3, label=expression(mu-3*sigma,mu-2*sigma,mu-sigma,mu,
#	mu+sigma,mu+2*sigma,mu+3*sigma))
#axis(1, at=-3:3, label=expression(3*sigma,2*sigma,sigma,0,
#	sigma,2*sigma,3*sigma))
axis(1, at=-3:3)

for(i in 1:length(hold$counts)){
	rect(hold$breaks[i], 0, hold$breaks[i+1], hold$density[i],
		border='#DDDDDD', col='#F4F4F4')
}
lines(X, Y)
abline(h=0)
