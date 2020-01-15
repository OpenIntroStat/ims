
par(mar=c(3.8, 4.5, 1, 1), mgp=c(2.2, 0.7, 0), las=1)
densityPlot(cars$price, col='#225588', histo='faded', fading='13', fadingBorder='28', breaks=15, xlab='price ($1000s)', main='', ylab='')
par(las=0)
mtext('density', side=2, line=3.3)
