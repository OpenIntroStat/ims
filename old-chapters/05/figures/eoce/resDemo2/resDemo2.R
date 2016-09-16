setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/resDemo2")

set.seed(8313)

x = seq(1:300)
yFan = rep(NA,300)
for(i in 1:300){
	yFan[i] = x[i]+rnorm(1)*x[i]
}
yLog = log(x)+rnorm(300, mean = 0, s = 0.5)


###

setwd("/Users/mine/Desktop/Open Intro/Chp 7 - EOCE/figures")

pdf("resDemoFan.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(yFan ~ x, xlab = "(a)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

lmFan= lm(yFan ~ x)
abline(lmFan, col = COL[4])

dev.off()

###

pdf("resDemoResScatFan.pdf", 5.5, 2)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(lmFan$res ~ x, xlab = "(a)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

abline(h = 0, lty = 2, lwd = 2)

dev.off()

###

pdf("resDemoLog.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(yLog ~ x, xlab = "(b)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

lmLog = lm(yLog ~ x)
abline(lmLog, col = COL[4])

dev.off()

###

pdf("resDemoResScatExp.pdf", 5.5, 2)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(lmLog$res ~ x, xlab = "(b)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

abline(h = 0, lty = 2, lwd = 2)

dev.off()

