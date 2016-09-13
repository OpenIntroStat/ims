require(openintro)
d <- read.delim('textS10.txt')

pdf('sbsBoxPlotsOfTextbookPricesS10.pdf', 3.2, 3.4)
par(mar=c(3, 4, 0.5, 0.5), las=1, mgp=c(2.8, 0.7, 0))

prices <- c(d$uclaNew, d$amazNew)
gp <- c(rep('UCLA', dim(d)[1]), rep('Amazon', dim(d)[1]))

dotPlot(prices, gp, vertical=TRUE, at=1:2+0.13, ylab='book prices (USD)', key=c('Amazon', 'UCLA'), col='#22558822', xlim=c(0.5,2.5), ylim=c(0, 220))
boxPlot(prices, gp, add=TRUE, axes=FALSE)
#axis(1,cex.axis=0.87, tck=-0.03)
#axis(2,cex.axis=0.87, tck=-0.02)
abline(h=0)
dev.off()