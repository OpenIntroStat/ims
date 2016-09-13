library(openintro)
data(COL)

pdf('stemCellTherapyForHeartsPValue.pdf', 3.9, 2.3)
par(mar=c(1.85, 1, 1, 1), mgp=c(2, 0.8, 0), las=1)

normTail(U=4.03, xlim=c(-3, 5.2), df=4, lwd=1.5, border=COL[4], col=COL[4], axes=FALSE)

# normTail(s=1.95, U=7.88, xlim=c(-6, 10), df=4, curveColor="#225588", lwd=2, border="#AA5500", col="#AA5500", axes=FALSE)

text(7.5-4, 0.23, "Area representing\np-value", col=COL[4])
arrows(7.5-4, 0.17, 4.3, 0.02, length=0.1, col=COL[4])

# text(8, 0.1, "Very slim tail", col="#AA5500")
# arrows(8, 0.08, 8.5, 0.01, length=0.1, col="#AA5500")
# lines(rep(7.88, 2), c(0, 0.03), col="#AA5500", lty=3)
# lines(rep(7.88, 2), c(0, 0.03), col="#AA5500", lty=3, lwd=2)

axis(1, at=seq(-8,12,2)) #, rep("", 11), tcl=-0.2)
# axis(1, at=seq(-8,12,4))

dev.off()