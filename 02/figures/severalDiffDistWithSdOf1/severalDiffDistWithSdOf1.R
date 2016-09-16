library(openintro)
data(COL)
pdf("severalDiffDistWithSdOf1.pdf", 5.5, 4.3)


x1 <- rep(0:1, c(10,10))
x1 <- (x1-mean(x1))/sd(x1)
x2 <- qnorm(seq(0.0025,0.9975, 0.00049))
x2 <- (x2-mean(x2))/sd(x2)
x3 <- qchisq(seq(0.01,0.98, 0.0005), 4)
x3 <- (x3-mean(x3))/sd(x3)

drawSDs <- function(m=0,s=1){
	abline(v=m, col='#00000033')
	rect(m-s, -5, m+s, 500, col='#00000025', border='#00000000')
	rect(m+s, -5, m+2*s, 500, col='#00000015', border='#00000000')
	rect(m-s, -5, m-2*s, 500, col='#00000015', border='#00000000')
	rect(m+2*s, -5, m+3*s, 500, col='#0000000B', border='#00000000')
	rect(m-2*s, -5, m-3*s, 500, col='#0000000B', border='#00000000')
	rect(m+4*s, -5, m+3*s, 500, col='#00000008', border='#00000000')
	rect(m-4*s, -5, m-3*s, 500, col='#00000008', border='#00000000')
}

xR <- c(-1,1)*max(c(x1,x2,x3))
par(mfrow=c(3,1), mar=c(3,1,0,1), mgp=c(2.7,1,0))
histPlot(x1, breaks=c(-1.05, -0.95, 0.95, 1.05), xlim=xR, axes=FALSE, xlab='',border=TRUE, lty=1, probability=TRUE, ylim=c(0, 5.6))
drawSDs()
histPlot(x1, breaks=c(-1.05, -0.95, 0.95, 1.05), add=TRUE, probability=TRUE, col=COL[1], ylim=c(0, 0.75))
axis(1, at=-4:4, cex.axis=1.5)
par(mar=c(3,1,0,1), mgp=c(2.7,1,0))
histPlot(x2, breaks=25, xlim=xR, axes=FALSE, xlab='',border=TRUE, lty=1, probability=TRUE, ylim=c(0, 0.43))
drawSDs()
histPlot(x2, breaks=25, add=TRUE, probability=TRUE, col=COL[1])
axis(1, at=-4:4, cex.axis=1.5)
par(mar=c(2.1,1,0,1), mgp=c(2.7,1,0))
histPlot(x3, breaks=25, xlim=xR, axes=FALSE, xlab='',border=TRUE, lty=1, probability=TRUE, ylim=c(0, 0.5))
drawSDs()
histPlot(x3, breaks=25, add=TRUE, probability=TRUE, col=COL[1])
axis(1, at=-4:4, cex.axis=1.5)


dev.off()
