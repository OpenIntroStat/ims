
COL <- c('#22883377', '#665511FF', '#002244')

ds <- density(cars$price[cars$type == 'small'])
dm <- density(cars$price[cars$type == 'midsize'])
dl <- density(cars$price[cars$type == 'large'])

yR <- c(0, max(c(ds$y, dm$y, dl$y)))
xR <- range(c(ds$x, dm$x, dl$x))

require(Cairo)
CairoPDF("carsPriceByTypeSBSandHH.pdf", 7.5, 4)

par(mar=c(3.6, 3.6, 1, 0.5), mgp=c(2.4, 0.7, 0), las=1, mfrow=1:2)
boxPlot(cars$price, cars$type, xlab='type', ylab='price')
#boxplot(cars$price ~ cars$type)
par(mar=c(3.6, 0.5, 1, 1), las=1)

histPlot(cars$price[cars$type == 'small'], col='#ffffff00', border=COL[1], probability=TRUE, xlim=xR, ylim=yR*1.1, xlab='price ($1000s)', ylab='', outline=TRUE, lty=1, axes=FALSE, lwd=2)
histPlot(cars$price[cars$type == 'midsize'], col='#ffffff00', border=COL[2], probability=TRUE, add=TRUE, outline=TRUE, lty=2, lwd=2)
histPlot(cars$price[cars$type == 'large'], col='#ffffff00', border=COL[3], probability=TRUE, add=TRUE, outline=TRUE, lty=3, lwd=2)
axis(1, at=seq(-20, 100, 20))

legend('topright', col=COL, lty=1:3, legend=c('small', 'midsize', 'large'), lwd=2)


dev.off()