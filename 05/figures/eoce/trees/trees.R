setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/trees")

data(trees)

###

pdf("girth_vol.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(trees$Volume ~ trees$Girth, xlab='Diameter (in inches)', ylab='Volume (in cubic ft)', pch=19, col=COL[1], axes = FALSE)
axis(1, at = seq(8,20,4))
axis(2, at = seq(10,70,30))
box()

dev.off()

###

pdf("height_vol.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(trees$Volume ~ trees$Height, xlab='Height (in ft)', ylab='Volume (in cubic ft)', pch=19, col=COL[1], axes = FALSE)
axis(1, at = seq(65,85,10))
axis(2, at = seq(10,70,30))
box()

dev.off()