library(openintro)
data(COL)

myPDF('satBelow1400.pdf', 1.25 * 2.8, 1.25 * 1.2,
      mar = c(1.5, 0, 0, 0), mgp = c(3, 0.45, 0))
normTail(1500, 300, 1400, axes = FALSE, col = COL[1])
axis(1, at = c(900, 1500, 2100))
dev.off()




myPDF('satAbove1400.pdf', 3, 1.2, mar=c(1.5,4,0.5,0), mgp=c(3,0.45,0))
normTail(1500, 300, U=1400, axes=FALSE, col=COL[1])
axis(1, at=c(900, 1500, 2100))
dev.off()
