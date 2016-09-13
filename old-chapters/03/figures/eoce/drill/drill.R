setwd("~/Desktop/Open Intro/EOCE - Second Edition/06/figures/eoce/drill")

###


pdf("drill_NA_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 0.0314
u = 0.1
l = -0.1

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

pdf("drill_sup_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 0.033
u = 0.013
l = -0.013

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,NA,m,NA,NA), cex.axis = 1.1)
axis(1, at = c(m - 3*s,l-0.02,m,u+0.02,m + 3*s), label = c(NA,"-0.013",NA,"0.013",NA), cex.axis = 1.1,tick = FALSE)

dev.off()