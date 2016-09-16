library(openintro)

oiB = "#3E9BC0"

###

pdf("oneSampleT_a.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
u = 1.91
n = 11
df = n - 1

normTail(m = m, s = s, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 2)
text(x = -2.5, y = 0.35, "(a)", cex = 2)

dev.off()

###


pdf("oneSampleT_b.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
l = -2.45
n = 17
df = n - 1

normTail(m = m, s = s, L = l, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,m + 3*s), label = c(NA,l,m,NA), cex.axis = 2)
text(x = -2.5, y = 0.35, "(b)", cex = 2)

dev.off()

###

pdf("oneSampleT_c.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
l = -0.83
u = 0.83
n = 7
df = n - 1

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 2)
text(x = -2.5, y = 0.35, "(c)", cex = 2)

dev.off()

###

pdf("oneSampleT_d.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
u = 2.13
n = 28
df = n - 1

normTail(m = m, s = s, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 2)
text(x = -2.5, y = 0.35, "(d)", cex = 2)

dev.off()