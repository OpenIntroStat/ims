setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/resDemo1")

x = seq(1,100,1)

set.seed(84628)
yLin = 3 * x + 5 + rnorm(length(x), mean = 0, sd = 20)
yFanBack = 4*x + 5 + rnorm(length(x), mean = 0, sd = sort(x, decreasing = TRUE))

###

setwd("/Users/mine/Desktop/Open Intro/Chp 7 - EOCE/figures")

pdf("resDemoLin.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(yLin ~ x, xlab = "(a)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

lmLin = lm(yLin ~ x)
abline(lmLin, col = COL[2], lwd = 2)

dev.off()

###

pdf("resDemoResScatLin.pdf", 5.5, 2)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(lmLin$res ~ x, xlab = "(a)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

abline(h = 0, lty = 2, lwd = 2)

dev.off()

###

pdf("resDemoFanBack.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(yFanBack ~ x, xlab = "(b)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

lmFanBack = lm(yFanBack ~ x)
abline(lmFanBack, col = COL[2], lwd = 2)

dev.off()

###

pdf("resDemoResScatFanBack.pdf", 5.5, 2)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(lmFanBack$res ~ x, xlab = "(b)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

abline(h = 0, lty = 2, lwd = 2)

dev.off()