setwd("~/Desktop/Open Intro/EOCE - Second Edition/05/figures/eoce/prison")

library(openintro)

prison = read.csv("~/Desktop/Open Intro/EOCE - Second Edition/data/prison.csv")

COL[1] = "#3E9BC0"

###

diff1 = prison$PreTrt1 - prison$PostTrt1
diff2 = prison$PreTrt2 - prison$PostTrt2
diff3 = prison$PreTrt3 - prison$PostTrt3

diff = c(diff1, diff2, diff3)
tr = c(rep("Tr 1", 14), rep("Tr 2", 14), rep("Tr 3", 14))

###

pdf("prison_qq.pdf", height = 2.5, width = 9)

par(mar=c(2,6,1.5,1), las=1, mgp=c(4.5,0.7,0), mfrow = c(1,3), cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5)

qqnorm(diff[tr == "Tr 1"], col = COL[1], pch = 19, main = "Tr 1", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(diff[tr == "Tr 1"], col = COL[1])

qqnorm(diff[tr == "Tr 2"], col = COL[1], pch = 19, main = "Tr 2", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(diff[tr == "Tr 2"], col = COL[1])

qqnorm(diff[tr == "Tr 3"], col = COL[1], pch = 19, main = "Tr 3", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(diff[tr == "Tr 3"], col = COL[1])

dev.off()


par(mar=c(3.75,2.75,0.5,0.5), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

boxPlot(diff, fact = tr, ylab = "", col = COL[1], horiz = TRUE, xlab = "Pre - Post scores", key = c("Tr 3", "Tr 2", "Tr 1"))

dev.off()

###

by(diff, tr, mean)
by(diff, tr, sd)

###

pdf("prison_tr1_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 3.29
u = 6.21
l = NA

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], df = 13)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

pdf("prison_tr2_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 2.12
u = 2.86
l = NA

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], df = 13)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###


pdf("prison_tr3_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 2.12
u = -1.40
l = NA

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], df = 13)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

xtable(anova(lm(diff~tr)))
summary(lm(diff~tr))

###

pdf("prison_pair_12_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 3.7
u = 3.35
l = -3.35

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], df = 39)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

pdf("prison_pair_13_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 3.7
u = 9.42
l = -9.42

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], df = 39)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###


pdf("prison_pair_23_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 3.7
u = 6.07
l = -6.07

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1], df = 39)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()
