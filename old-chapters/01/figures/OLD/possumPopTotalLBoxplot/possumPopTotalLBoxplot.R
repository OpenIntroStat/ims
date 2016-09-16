
par(mar=c(3.5, 3.6, 1, 1), mgp=c(2.4,0.7,0), las=1)
boxPlot(possum$totalL, possum$pop, ylab='total length')
mtext('population', side=1, line=2)
