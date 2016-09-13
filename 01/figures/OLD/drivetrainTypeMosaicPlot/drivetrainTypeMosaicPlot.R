tab <- table(cars[,c('type', 'driveTrain')])[3:1,2:3]
rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

par(mfrow=c(1,1), mar=c(2,2,1,2), las=1)
mosaicplot(t(tab), main='', xlab='', ylab='')
mtext('driveTrain', side=1, line=0.8)
par(las=0)
mtext('type', side=2, line=0.8)
rect(-5,5,2,1, col='#ffffff', border='#ffffff')
text(0.5, 0.972, 'front', pos=3, cex=0.8)
text(0.91, 0.972, 'rear', pos=3, cex=0.8)
rect(-5,0,0.065,1, col='#ffffff', border='#ffffff')
text(0.1, 0.045, 'large', pos=2, cex=0.8)
text(0.1, 0.335, 'midsize', pos=2, cex=0.8)
text(0.1, 0.765, 'small', pos=2, cex=0.8)

