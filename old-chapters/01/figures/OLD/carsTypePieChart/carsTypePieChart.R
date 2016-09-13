par(mar=c(0,2,0, 0), mgp=c(2.4, 0.7, 0), las=1, mfrow=1:2)
tab <- table(cars$type)
pie(tab, col=c('#AA3333','#88DD44','#BBDDFF'))

par(las=1, mar=c(3.6, 5.2, 1, 1))
barplot(tab, axes=TRUE, xlab='type', ylab='count', main='')

#barplot(t, axes=FALSE, xlab='type', ylab='', main='')
