library(openintro)
data(cars)

tab <- table(cars[,c('type', 'driveTrain')])[3:1,2:3]
tab <- tab[,2:1]
rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("typeDriveTrainMosaicPlotType.pdf", 3.5, 3.5, mar=c(2.2,0.5,0.5,0.5), las=1)
mosaicplot(apply(tab, 1, sum), main='', off=3)
mtext('type', side=1, line=0.8)
rect(-5,5,2,1, col='#ffffff', border='#ffffff')
text(0.17, 0.972, 'small', pos=3, cex=0.8)
text(0.57, 0.972, 'midsize', pos=3, cex=0.8)
text(0.894, 0.972, 'large', pos=3, cex=0.8)
dev.off()

myPDF("typeDriveTrainMosaicPlotFull.pdf", 3.5, 3.5, mar=c(2.2,0.5,0.5,0.5), las=1)
#par(mar=c(2,2.5,1,0))
mosaicplot(tab, main='', xlab='', ylab='')
par(las=0)
mtext('driveTrain', side=2, line=0.8)
mtext('type', side=1, line=0.8)
rect(-5,-5,0.07,1, col='#ffffff', border='#ffffff')
text(0.01, 0.4, 'front', cex=0.8)
text(0.01, 0.985, 'rear', cex=0.8)
rect(-5,5,2,1, col='#ffffff', border='#ffffff')
text(0.25, 0.972, 'small', pos=3, cex=0.8)
text(0.615, 0.972, 'midsize', pos=3, cex=0.8)
text(0.89, 0.972, 'large', pos=3, cex=0.8)

#mosaicplot(t(tab), main='')
#rect(-5,-5,0.05,1, col='#ffffff', border='#ffffff')
#text(0, 0.5, 'front', cex=2/3)
#text(0, -0.025, 'rear', cex=2/3)

dev.off()

