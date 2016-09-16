library(openintro)

oiB = "#3E9BC0"

#

pdf("warming.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 4.9/sqrt(51)
u = 1.1

normTail(m = m, s = s, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.5)

dev.off()