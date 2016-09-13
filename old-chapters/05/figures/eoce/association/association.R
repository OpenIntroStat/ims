library(openintro)
data(COL)

###

set.seed(9274)

x = seq(0, 6, by = 0.05)

y1 = (x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 1)
y2 = 3*x + 10 + rnorm(length(x), mean = 0, sd = 2)
y3 = 3*x + 10 + rnorm(length(x), mean = 0, sd = 20)

###

pdf("association1.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(y1 ~ x, xlab = "(a)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

dev.off()

###

pdf("association2.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(y2 ~ x, xlab = "(b)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

dev.off()

###

pdf("association3.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(y3 ~ x, xlab = "(c)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

dev.off()

###

x = seq(-8, -2, by = 0.05)

y4 = -1 * (x+5)^2 + 1 + rnorm(length(x), mean = 0, sd = 2)

###

pdf("association4.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(y4 ~ x, xlab = "(d)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

dev.off()

###

y5 = -5 * x + 3 + rnorm(length(x), mean = 0, sd = 2)

###

pdf("association5.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(y5 ~ x, xlab = "(e)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)

dev.off()

###

y6 = rnorm(length(x), mean = 0, sd = 1)

###

pdf("association6.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))

plot(y6 ~ x, xlab = "(f)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], ylim = c(-10,10), cex.lab = 1.75, cex.axis = 1.75)

dev.off()


###
###

x = seq(-3, 4, 0.05)

y7 =  -0.5 * x^3 + x^2 + x + rnorm(length(x), mean = 0, sd = 2)
y8 =  2 * x^4 + -0.5 * x^3 + x^2 + x + rnorm(length(x), mean = 0, sd = 30)
y9 = 3 * x + rnorm(length(x), mean = 0, sd = 2)
y10 = 3 * x + rnorm(length(x), mean = 0, sd = 20)
y11 = -3 * x + rnorm(length(x), mean = 0, sd = 10) 
y12 = -3 * x + rnorm(length(x), mean = 0, sd = 5) 

###

pdf("association7.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y7 ~ x, xlab = "(a)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)
dev.off()

###

pdf("association8.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y8 ~ x, xlab = "(b)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)
dev.off()

###

pdf("association9.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y9 ~ x, xlab = "(c)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)
dev.off()

###

pdf("association10.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y10 ~ x, xlab = "(d)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75, ylim = c(-80,60))
dev.off()

###

pdf("association11.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y11 ~ x, xlab = "(e)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)
dev.off()

###

pdf("association12.pdf", 5.5, 4.3)
par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0))
plot(y12 ~ x, xlab = "(f)", ylab = "", yaxt = "n", xaxt = "n", pch=19, col=COL[1], cex.lab = 1.75, cex.axis = 1.75)
dev.off()

###

