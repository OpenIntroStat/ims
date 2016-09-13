setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/corrMatch")

set.seed(1234)

x = seq(0, 6, by = 0.05)

y1 = (x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 1)
y2 = 3*x + 10 + rnorm(length(x), mean = 0, sd = 2)
y3 = 3*x + 10 + rnorm(length(x), mean = 0, sd = 10)
y4 = -3 * x + rnorm(length(x), mean = 0, sd = 5)
y5 =  -0.5 * x^2 + x + rnorm(length(x), mean = 0, sd = 2)
y6 =  x + rnorm(length(x), mean = 0, sd = 3)
y7 = -(x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 1)
y8 = -3 * x + rnorm(length(x), mean = 0, sd = 10)

###

round(cor(y1,x),2)
round(cor(y2,x),2)
round(cor(y3,x),2)
round(cor(y4,x),2)

###

pdf("corrMatch1.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y1 ~ x, xlab = "(1)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

pdf("corrMatch2.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y2 ~ x, xlab = "(2)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

pdf("corrMatch3.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y3 ~ x, xlab = "(3)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

pdf("corrMatch4.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y4 ~ x, xlab = "(4)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###
###

round(cor(y5,x),2)
round(cor(y6,x),2)
round(cor(y7,x),2)
round(cor(y8,x),2)

###

pdf("corrMatch5.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y5 ~ x, xlab = "(1)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

pdf("corrMatch6.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y6 ~ x, xlab = "(2)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

pdf("corrMatch7.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y7 ~ x, xlab = "(3)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

pdf("corrMatch8.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y8 ~ x, xlab = "(4)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75)
dev.off()

###

