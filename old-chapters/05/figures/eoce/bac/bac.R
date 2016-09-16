setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/bac")

bac = read.table("bac.txt", h = T, sep = "\t")

###

pdf("bloodAlc.pdf", 5.5, 4.3)

par(mar=c(3.5,5,1,1), las=1, mgp=c(2.3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(bac$BAC ~ bac$Beers, xlab='Cans of beer', ylab='BAC (grams per deciliter)\n', pch=19, col=COL[1], cex.lab = 1.5, cex.axis = 1.5)

dev.off()

###

library(xtable)

xtable(summary(lm(bac$bac ~ bac$beers)))

