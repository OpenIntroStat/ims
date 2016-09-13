require(openintro)

d <- read.delim('satGPA.txt')

#plot(d$SATSum/2, d$FYGPA)
g <- lm(d$FYGPA ~ I(d$SATSum/2))

pdf('overallSATGPADataWithLSRLine.pdf', 5, 3.3)
par(mar=c(3, 3, 1, 1), mgp=c(1.8, 0.6, 0), las=1)
plot(d$SATSum/2, d$FYGPA, #, col=fadeColor(d$sex, '88'), pch=c(1,20)[d$sex], cex=c(1,1.5)[d$sex],
col='#22558863', pch=20, cex=1,
xlab='SAT (percentile)', ylab='First Year GPA')
abline(g, lwd=2)
dev.off()