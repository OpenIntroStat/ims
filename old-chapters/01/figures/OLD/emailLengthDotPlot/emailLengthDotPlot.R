
library(openintro)
data(email50)
COL <- c('#55000044','#556699')

myPDF("emailLengthDotPlot.pdf", 7.5, 1.25, mar=c(3.6,1,0,1), las=1, mgp=c(2.5,0.7,0))
set.seed(1)
d <- email50$line_breaks
dotPlot(d, xlab='Number of Lines', ylab='', pch=20, col=COL[1], cex=1.5, ylim=c(0.95,1.05))
M <- mean(d)
polygon(M + c(-2,2,0)*15, c(0.95, 0.95, 0.98), border=COL[2], col=COL[2])

dev.off()

