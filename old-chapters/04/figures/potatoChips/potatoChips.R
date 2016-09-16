library(openintro)
data(COL)

myPDF('potatoChips.pdf', 2.15, 1.13, las=1, mar=c(1.31,0,0.01,0), mgp=c(3,0.45,0))
normTail(130, 3, L=126, U=134, col = COL[1], xAxisIncr = 2)
dev.off()