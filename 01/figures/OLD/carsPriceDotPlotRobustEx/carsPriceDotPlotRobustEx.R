library(openintro)
data(cars)

COL <- c('#55000044','#556699')

p1 <- cars$price
p2 <- p1
p2[which.max(p2)] <- 200
p3 <- p1
p3[which.min(p3)] <- 200

myPDF("carsPriceDotPlotRobustEx.pdf", 6.5*1.1, 1.4*1.1, mar=c(2.9,0.1,0.5,0), las=1, mgp=c(1.7,0.7,0), cex.lab=0.85)


dotPlot(p1, at=3, xlab='price ($1000s)', ylab='', pch=20, col=COL[1], cex=1, ylim=c(0.5,3.5), xlim=c(-60,215), axes=FALSE)
axis(1, at=seq(0,200, 50), cex.axis=0.8)
text(0, 3, 'original', pos=2, cex=0.8)
dotPlot(p2, at=2, add=TRUE, pch=20, col=COL[1], cex=1)
text(0, 2, '$61,900 to $200,000', pos=2, cex=0.8)
dotPlot(p3, at=1, add=TRUE, pch=20, col=COL[1], cex=1)
text(0, 1, '$7,400 to $200,000', pos=2, cex=0.8)

dev.off()