library(openintro)
data(COL)

set.seed(1)
obs1 <- 0.3*rchisq(25, 1.4)

set.seed(5)
obs2 <- 16-2*rlnorm(50, sdlog=0.8)


myPDF("normalQuantileExerAdditional.pdf", 6*1.2, 5.3/2*1.2, mfrow=c(1,2), mgp=c(2.4,.55,0), mar=c(3.5,3.45,1,1), cex.lab=1.1)

qqnorm(obs1, cex=0.9, main='', axes=FALSE, ylab='Observed', xlab="", col=COL[1], lwd=2)
mtext("Theoretical quantiles", 1, 1.8, cex=0.8)
axis(1, cex.axis=1.1)
axis(2, at=0:2, cex.axis=1.1)

qqnorm(obs2, cex=0.9, main='', axes=FALSE, ylab='Observed', xlab="", col=COL[1], lwd=2)
mtext("Theoretical quantiles", 1, 1.8, cex=0.8)
axis(1, cex.axis=1.1)
axis(2, at=seq(5,15,5), cex.axis=1.1)


dev.off()