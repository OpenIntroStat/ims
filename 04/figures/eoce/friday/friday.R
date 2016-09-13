
library(openintro)
data(friday)
load("friday.Rda")

friday_tr = friday[friday$type == "traffic",]

###

pdf("friday_traffic_qq.pdf", height = 2.5, width = 9)

par(mar=c(2,6,1.5,1), las=1, mgp=c(4.5,0.7,0), mfrow = c(1,3), cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5)

qqnorm(friday_tr$sixth, col = COL[1], pch = 19, main = "6th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_tr$sixth, col = COL[1])
qqnorm(friday_tr$thirteenth, col = COL[1], pch = 19, main = "13th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_tr$thirteenth, col = COL[1])
qqnorm(friday_tr$sixth - friday_tr$thirteenth, col = COL[1], pch = 19, main = "Diff.", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_tr$sixth - friday_tr$thirteenth, col = COL[1])

dev.off()

###

pdf("friday_traffic_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1176/sqrt(10)
u = 1835
l = -1835

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], xlim = c(-1850,1850))
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

friday_acc = friday[friday$type == "accident",]

###

pdf("friday_acc_qq.pdf", height = 2.5, width = 6)

par(mar=c(2,5,1.5,1), las=1, mgp=c(4.5,0.7,0), mfrow = c(1,2))

qqnorm(friday_acc$sixth, col = COL[1], pch = 19, main = "6th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_acc$sixth, col = COL[1])
qqnorm(friday_acc$thirteenth, col = COL[1], pch = 19, main = "13th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_acc$thirteenth, col = COL[1])
dev.off()

pdf("friday_acc_qq1.pdf", height = 2.5, width = 3)
par(mar=c(2,5,1.5,1), las=1, mgp=c(4.5,0.7,0))
qqnorm(friday_acc$sixth - friday_acc$thirteenth, col = COL[1], pch = 19, main = "Diff.", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_acc$sixth - friday_acc$thirteenth, col = COL[1])

dev.off()

###

pdf("friday_acc_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 3.01/sqrt(6)
u = 3.33
l = -3.33

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1])
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()
