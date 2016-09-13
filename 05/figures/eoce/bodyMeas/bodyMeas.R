library(openintro)
data(bdims)
load("bdims.rda")

###

pdf("bodyHgtShoGi.pdf", 6, 4.3)

par(mar=c(4,4.9,0.5,0.5), las=1, mgp=c(2.8,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(bdims$hgt ~ bdims$sho.gi, xlab="Shoulder girth (in cm)", ylab="", pch=19, col=fadeColor(COL[1],90))
mtext("Height (in cm)", 2, 3.7, las=0, cex=1.5)

dev.off()

###

pdf("bodyWgtHipGi.pdf", 6, 4.3)

par(mar=c(4,4.9,0.5,0.5), las=1, mgp=c(2.8,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(bdims$wgt ~ bdims$hip.gi, xlab="Hip girth (in cm)", ylab="", pch=19, col=fadeColor(COL[1],90), ylim = c(40,120), xlim = c(75,135))
mtext("Weight (in kg)", 2, 3.7, las=0, cex=1.5)

dev.off()

###

cor(bdims$Hgt, bdims$ShoGi)
mean(bdims$Hgt)
sd(bdims$Hgt)
mean(bdims$ShoGi)
sd(bdims$ShoGi)

###

pdf("bodyWgtHgt.pdf", 6, 4.3)

par(mar=c(4,4.9,0.5,0.5), las=1, mgp=c(2.8,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(bdims$wgt ~ bdims$hgt, xlab="Height (in cm)", ylab="", pch=19, col=fadeColor(COL[1],90), axes = FALSE, xlim = c(145,205))
mtext("Weight (in kg)", 2, 3.7, las=0, cex=1.5)

axis(1, at = seq(150,200,25))
axis(2)
box()

dev.off()

##

library(xtable)

xtable(summary(lm(bdims$wgt ~ bdims$hgt)))