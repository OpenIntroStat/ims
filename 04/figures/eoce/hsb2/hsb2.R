#setwd("~/Desktop/Open Intro/EOCE - Second Edition/05/figures/eoce/hsb2")

library(openintro)
data(hsb2)
load("hsb2.rda")

#

pdf('hsb2_read_write_box.pdf', height = 3, width = 5)
par(mar=c(3, 4, 0.5, 0.5), las=1, mgp=c(2.8, 0.7, 0), cex.axis = 1.1, cex.lab = 1.1)
scores <- c(hsb2$read, hsb2$write)
gp <- c(rep('read', nrow(hsb2)), rep('write', nrow(hsb2)))
openintro::dotPlot(scores, gp, vertical=TRUE, ylab = "scores", at=1:2+0.13, col=fadeColor(COL[1],33), xlim=c(0.5,2.5), ylim=c(20, 80), axes = FALSE, cex.lab = 1.25, cex.axis = 1.25)
axis(1, at = c(1,2), labels = c("read","write"), cex.lab = 1.25, cex.axis = 1.25)
axis(2, at = seq(20,80,20), cex.axis = 1.25)
boxplot(scores ~ gp, add=TRUE, axes=FALSE)
abline(h=0)
dev.off()

#

pdf('hsb2_diff_hist.pdf', height = 3, width = 5.5)
par(mar=c(3.3, 4, 0.5, 0.5), las=1, mgp=c(2.1, 0.7, 0), cex.axis = 0.9, cex.lab = 0.9)
histPlot(hsb2$read - hsb2$write, col = COL[1], xlab = "Differences in scores (read - write)", ylab = "", cex.lab = 1.25, cex.axis = 1.25)
dev.off()

#

pdf("hsb2_read_write_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 8.887/sqrt(200)
l = -0.545
u = 0.545

normTail(m = m, s = s, L = l, U = u, axes = FALSE, col = COL[1])
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()