pdf("nySleep_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 8
s = 0.154
u = NA
l = 7.73

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB, df = 21)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()
