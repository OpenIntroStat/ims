require(openintro)
data(email)
data(COL)

myPDF('emailNumberBarPlot.pdf', 6.5, 2.8, mar=c(3.6, 4.5, 1, 1.5), mgp=c(3.4, 0.7, 0), las=1, mfrow=1:2)
t <- table(email$number)
barplot(t, axes=TRUE, xlab='', ylab='count', main='', ylim=c(0,2700), col=COL[1])
abline(h=0)
mtext("number", 1, 2.4)
par(las=0)



par(las=1, mar=c(3.6, 4.7, 1, 1))
barplot(t/sum(t), axes=FALSE, xlab='number', ylab='', main='', ylim=c(0,2700)/sum(t), col=COL[1])
axis(2, at=seq(0, 0.6, 0.2))
par(las=0)
mtext('proportion', side=2, line=2.7)
mtext("number", 1, 2.4)
abline(h=0)

#barplot(t, axes=FALSE, xlab='type', ylab='', main='')


dev.off()

tab <- table(email$number, email$spam)
tab
