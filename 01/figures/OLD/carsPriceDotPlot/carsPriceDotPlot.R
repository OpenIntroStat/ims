library(openintro)
data(cars)

COL <- c('#55000044','#556699')

myPDF("carsPriceDotPlot.pdf", 7.5, 1.25, mar=c(3.6,1,0,1), las=1, mgp=c(2.5,0.7,0))

dotPlot(cars$price, xlab='price ($1000s)', ylab='', pch=20, col=COL[1], cex=1.5, ylim=c(0.95,1.05))
#arrows(mean(cars$price), .09, mean(cars$price), 0.03, length=0.08, col=COL[2])
#text(mean(cars$price), 0.08, 'mean price', col=COL[2], pos=3, cex=0.8)
polygon(c(18,21.98,19.99), c(0.95, 0.95, 0.98), border=COL[2], col=COL[2])

dev.off()