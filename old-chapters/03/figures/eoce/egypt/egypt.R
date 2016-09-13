library(openintro)
data(COL)
set.seed(5)

n = 20
N = 10^4

pdf("egypt.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.5,1,0), mfrow = c(1,1))

pHat <- rbinom(N, n, 0.69)/n
M    <- max(pHat)*n

histPlot(pHat, breaks=(11:(2*M)+0.75)/2/n, xlab=expression(hat(p)[sim]*"    "), col=COL[7], ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c("0","0.05","0.10","0.15"))
abline(h = 0)

abline(h = seq(250,1500,250), lty = 3, lwd = 2, col = "gray")

sum(pHat <= 0.57)/10^4

dev.off()

#


pdf("egyptSoln.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.5,1,0), mfrow = c(1,1), cex.axis = 1.25, cex.lab = 1.25)

histPlot(pHat, breaks=(11:(2*M)+0.75)/2/n, xlab=expression(hat(p)[sim]*"    "), col=COL[7], ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c("0","0.05","0.10","0.15"))
abline(h = 0)

histPlot(pHat[pHat <= 0.57], breaks=(-1:(2*M)+0.75)/2/n, col=COL[1], add=TRUE)

lines(rep(0.57, 2), c(0, 3)*N/22, lty=3, lwd=1.7)
text(0.57, 3*N/22, "0.57", pos=3, cex=1.25)

sum(pHat <= 0.57)/10^4

dev.off()