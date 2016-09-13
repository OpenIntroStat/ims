library(openintro)
data(COL)


myPDF("pValueCPRStudyLargeSampleAnalysisInSmallSampleSection.pdf", 5, 2.1, mar=c(2, 0.5, 0.5, 0.5))
normTail(0, 0.0955, L=-0.13, U=0.13, col=COL[1], lwd=1.5)
text(0.22, 2.3, "right tail", col=COL[1])
arrows(0.21, 2.1, 0.19, 1, length=0.10, col=COL[1])
lines(c(0.13, 0.13), c(0, 2.9), lty=3, lwd=2)
text(0.13, 2.9, expression(hat(p)[t]-hat(p)[c]), pos=3)
dev.off()