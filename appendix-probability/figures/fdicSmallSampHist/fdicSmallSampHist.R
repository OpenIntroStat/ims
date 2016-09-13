require(Cairo)

CairoPDF('fdicSmallSampHist.pdf', 3.5, 2.5)


set.seed(16)
samp <- sample(br[-185], 1000, TRUE, counts)

par(mar=c(4,1,1,1), mgp=c(2.4, 0.7, 0))
histPlot(samp, xlab='heights (cm)', breaks=seq(125, 210, 1), axes=FALSE)
axis(1, at=seq(140, 200, 20))

dev.off()
