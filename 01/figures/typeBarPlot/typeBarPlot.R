require(openintro)
data(cars)

myPDF('typeBarPlot.pdf', 6.5, 2.8, mar=c(3.6, 4.2, 1, 1.5), mgp=c(2.4, 0.7, 0), las=1, mfrow=1:2)
t <- table(cars$type)[3:1]
barplot(t, axes=TRUE, xlab='type', ylab='count', main='')
par(las=0)



par(las=1, mar=c(3.6, 4.7, 1, 1))
barplot(t, axes=FALSE, xlab='type', ylab='', main='')
axis(2, at=seq(0, 0.4, 0.1)*54, labels=format(seq(0, 0.4, 0.1)))
par(las=0)
mtext('proportion', side=2, line=2.7)

#barplot(t, axes=FALSE, xlab='type', ylab='', main='')


dev.off()
