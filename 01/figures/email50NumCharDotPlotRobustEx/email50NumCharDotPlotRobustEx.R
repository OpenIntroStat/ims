library(openintro)
data(email50)
data(COL)

p1 <- email50$num_char
p2 <- p1[-which.max(p1)]
p3 <- p1
p3[which.max(p1)] <- 150

myPDF("email50NumCharDotPlotRobustEx.pdf", 6.4*1.1, 1.3*1.1, mar=c(2.6,0.1,0.3,0), las=1, mgp=c(1.45,0.25,0), cex.lab=0.85)


dotPlot(p1, at=3, xlab='Number of Characters (in thousands)', ylab='', pch=20, col=COL[1,3], cex=1, ylim=c(0.5,3.5), xlim=c(-3.5e1,151), axes=FALSE)
axis(1, at=seq(0,150,50), cex.axis=0.8)
text(0, 3, 'Original', pos=2, cex=0.8)

dotPlot(p2, at=2, add=TRUE, pch=20, col=COL[1,3], cex=1)
text(0, 2, 'Drop 64,401', pos=2, cex=0.8)

dotPlot(p3, at=1, add=TRUE, pch=20, col=COL[1,3], cex=1)
text(0, 1, '64,401 to 150,000', pos=2, cex=0.8)

dev.off()


(temp <- round(quantile(p1, c(0.25, 0.5, 0.75)), 3))
temp[3] - temp[1]; mean(p1); sd(p1)
(temp <- round(quantile(p2, c(0.25, 0.5, 0.75)), 3))
temp[3] - temp[1]; mean(p2); sd(p2)
(temp <- round(quantile(p3, c(0.25, 0.5, 0.75)), 3))
temp[3] - temp[1]; mean(p3); sd(p3)

