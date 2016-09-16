setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/outliers")

set.seed(83629)
x = seq(1,50,1)

y = -2 * x + 20 + rnorm(length(x), mean = 0, sd = 10)

xInf = c(x[1:49], 200)

yLev = c(y[1:49], -370)

yOut = c(y[1:25], y[26]+100, y[27:50])

###

pdf("outInf1.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(1,0.7,0), cex.lab = 1.5)

plot(y ~ xInf, pch = 19, col=COL[1], xlab = "(a)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmInf = lm(y ~ xInf)
abline(lmInf, col = COL[2])

dev.off()

###

pdf("outLev1.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(1,0.7,0), cex.lab = 1.5)

plot(yLev ~ xInf, pch = 19, col=COL[1], xlab = "(b)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmLev = lm(yLev ~ xInf)
abline(lmLev, col = COL[2])

dev.off()

###

pdf("outOut1.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(1,0.7,0), cex.lab = 1.5)

plot(yOut ~ x, pch = 19, col=COL[1], xlab = "(c)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmOut = lm(yOut~ x)
abline(lmOut, col = COL[2])

dev.off()

##
##

x = seq(1,50,1)

y = 3 * x + 3 + rnorm(length(x), mean = 0, sd = 10)

xInf = c(x[1:49], -50)

yInf = c(y[1:49], -300)

yOut = c(y[1:25], y[26]+100, y[27:50])


pdf("outInf2.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(1,0.7,0), cex.lab = 1.5)

plot(y ~ xInf, pch = 19, col=COL[1], xlab = "(a)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmInf = lm(y ~ xInf)
abline(lmInf, col = COL[2])

dev.off()

###

pdf("outInf3.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(1,0.7,0), cex.lab = 1.5)

plot(yInf ~ xInf, pch = 19, col=COL[1], xlab = "(b)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

abline(lm(yInf ~ xInf), col = COL[2])

dev.off()

###

pdf("outOut2.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(1,0.7,0), cex.lab = 1.5)

plot(yOut ~ x, pch = 19, col=COL[1], xlab = "(c)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmOut = lm(yOut~ x)
abline(lmOut, col = COL[2])

dev.off()

