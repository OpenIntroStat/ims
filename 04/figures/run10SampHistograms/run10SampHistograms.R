library(openintro)
data(COL)

data(run10Samp)
d <- run10Samp

myPDF("run10SampHistograms.pdf", 7, 2.8, mfrow=1:2, mar=c(3.5, 3.5, 0.5, 1.5), mgp=c(2.2, 0.55, 0))

histPlot(d$time, main="", xlab="Time (minutes)", ylab="Frequency", col=COL[1])

par(mar=c(3.5, 4.5, 0.5, 0.5))
histPlot(d$age, main="", xlab="Age (years)", ylab="Frequency", col=COL[1])
dev.off()
