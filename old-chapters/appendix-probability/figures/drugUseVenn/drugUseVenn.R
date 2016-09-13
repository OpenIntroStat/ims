library(openintro)
data(COL)

pdf('drugUseVenn.pdf', 4.5, 2.4)

#COL <- c('#113366', '#336611BB')
# the proportions are not exactly right but adjusted slightly for aesthetics
par(mar=rep(0,4))
plot(0:1, c(0, 1.09), type='n', axes=FALSE)
rect(0, 0, 1, 1.01, lwd=2)
text(0.1, 1, 'Drug use', pos=3)
rect(0.05, .88-47/70, .73, .88, border=COL[1], lty=2, lwd=2)
text(0.25, 0.87, 'parents used', col=COL[1], pos=3)
rect(.27, .02, .92, .72, border=COL[4], lty=3, lwd=2.512)
text(0.87, 0.7, 'student uses', col=COL[4], pos=3)
text(0.2, 0.8, '0.19', col=COL[1])
text(0.75, 0.1, '0.21', col=COL[4])
text(0.5, 0.5, 0.28, col=COL[1])
text(0.5, 0.5, 0.28, col=COL[4])
text(0.134, 0.1, 'neither: 0.32')


dev.off()