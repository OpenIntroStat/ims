library(openintro)
data(COL)
set.seed(2)

pHat <- rbinom(10^4, 62, 0.1)/62
M    <- max(pHat)*62

sum(pHat<0.05)/10^4


myPDF("MedConsNullSim.pdf", 6.6, 2.5, mgp=c(2, 0.5, 0), mar=c(3.1, 4.6, 0.5, 0.5))
histPlot(pHat, breaks=(-1:(2*M)+0.75)/2/62, xlab=expression(hat(p)[sim]*"    "), col=COL[7,3], ylab="")
histPlot(pHat[pHat < 0.05], breaks=(-1:(2*M)+0.75)/2/62, col=COL[1], add=TRUE)
par(las=0)
mtext("Number of simulations", 2, 3.3)
dev.off()

myPDF("MedConsNullSim_w_normal.pdf", 7, 3.5, mgp=c(2, 0.5, 0), mar=c(3.1, 1.5, 0.5, 0.5))
histPlot(pHat, breaks=(-1:(2*M)+0.75)/2/62, xlab=expression(hat(p)[sim]*"    "), col=COL[2], ylab="", axes = FALSE)
axis(1)
x0 <- seq(-0.1, .5, length.out = 1000)
y0 <- dnorm(x0, 0.1, 0.038)
lines(x0, 150 * y0)
lines(c(0.05, 0.05), c(0, 1200), lty = 2, lwd = 2)
text(0.05, 1200, "Observed\nvalue", pos = 3, cex = 0.8)
dev.off()

myPDF('MedConsNullSim_normal_only.pdf',
      5*0.9, 2.3*0.8, mar = c(2, 0.5, 0.2, 0.5))
normTail(0.1, 0.038, 0.048, 0.152, col = COL[1], xAxisIncr = 2, axes = FALSE)
a <- c(0.02, 0.1, 0.18)
axis(1, a, format(a))
dev.off()

pnorm(-0.052 / 0.038) * 2

