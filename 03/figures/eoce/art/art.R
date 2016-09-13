#setwd("~/Desktop/Open Intro/EOCE - Second Edition/06/figures/eoce/art")
library(openintro)
data(COL)
set.seed(15)

n = 25
N = 10^4
p = 0.31

pdf("art.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.5,1,0), mfrow = c(1,1))

pHat <- rbinom(N, n, p)/n
M    <- max(pHat)*n

histPlot(pHat, breaks=(-1:(2*M)+0.75)/2/n, xlab=expression(hat(p)[sim]*"    "), col=COL[7], ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c("0","0.05","0.10","0.15"))
abline(h = 0)

abline(h = seq(250,1500,250), lty = 3, lwd = 2, col = "gray")

sum(pHat >= 0.4)/10^4

dev.off()

#


pdf("artSoln.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.5,1,0), mfrow = c(1,1), cex.axis = 1.25, cex.lab = 1.25)

histPlot(pHat, breaks=(-1:(2*M)+0.75)/2/n, xlab=expression(hat(p)[sim]*"    "), col=COL[7], ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c("0","0.05","0.10","0.15"))
abline(h = 0)

#histPlot(pHat[pHat >= 0.40], breaks=(-1:(2*M))/2/n, col="#5588BB", add=TRUE)
histPlot(pHat[pHat >= 0.40], breaks=(-1:(2*M)+0.75)/2/n, col=COL[1], add=TRUE)

lines(rep(0.4, 2), c(0, 3)*N/22, lty=3, lwd=1.7)
text(0.4, 3*N/22, "0.4", pos=3, cex=1.25)

sum(pHat >= 0.4)/10^4

dev.off()