
par(mar=c(3.8, 4.5, 1, 1), mgp=c(2.2, 0.7, 0), las=1)
densityPlot(cars$mpgCity, breaks=12, col='#225588', fading='19', fadingBorder='33', ylab='', xlab='miles per gallon', main='', histo='faded')
par(las=0)
mtext('density', side=2, line=3.3)
