pdf("gaming_eating_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 11.14
u = 30
l = -30

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB, df = 21)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

pdf("gaming_recall_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 0.543
u = 1.2
l = -1.2

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB, df = 21)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()