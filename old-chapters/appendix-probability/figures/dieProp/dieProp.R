library(openintro)
data(COL)

myPDF('dieProp.pdf', 6.5, 3.5, mar=c(3.8, 3.8, 0.5, 0.5))

#===> simulate <===#
set.seed(51)
n=10^5
x <- sample(0:1,n, T, p=c(5/6,1/6))
y <- cumsum(x)/1:n
X <- c(1:100, seq(102, 500, 2),
	seq(510, 1500, 10), seq(1550, 10000, 50),
	seq(10100, 25000, 100), seq(25250, 100000, 250))
Y <- y[X]

#===> plotting <===#
#par(mar=c(4,4.3,0,1),las=1)
plot(X, Y, log='x', type='l', xlab='', ylab='', axes=FALSE, col=COL[1], lwd=1.5)
mtext('n (number of rolls)', side=1, line=2.5)
abline(h=1/6, lty=2)
axis(1, at=10^(0:5), cex.axis=0.9, labels=c('1','10','100','1,000','10,000','100,000'))
axis(2, cex.axis=0.9)
axis(2, at=1/6, line=2.3, tick=FALSE, labels=expression(paste(hat(p)[n])), cex.axis=1.1)

dev.off()
