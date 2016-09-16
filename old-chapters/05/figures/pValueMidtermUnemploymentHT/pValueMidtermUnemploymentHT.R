library(openintro)
data(COL)

myPDF("pValueMidtermUnemploymentHT.pdf", 1.15*5.5, 1.15*2.5, mar=c(1.8,0.5,0.2,0.5))
normTail(0, 0.8717, U = 1.0010, L=-1.0010, df=24, col=COL[1])
dev.off()
