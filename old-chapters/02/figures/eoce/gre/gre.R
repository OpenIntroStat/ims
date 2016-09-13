pdf("gre.pdf", height = 3, width = 5)

par(mar=c(0,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1

X <- m+s*seq(-3.2,3.2,0.01)
Y <- dnorm(X, m, s)

plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4), ylim=c(-0.11, 0.4), ylab = "")
lines(X, rep(0,length(X)))

colDarkBlue = "#569BBD"
colRed = "#F05133"

lines(c(0,0), dnorm(0)*c(0.01,0.99), col = "darkgray", lty=3)

z = 1.33
text(x = z+0.1, dnorm(z)*1.05, "VR", pos=3, col= colDarkBlue, cex = 1.5)
text(x = z + 0.5, y = -0.03, "z = 1.33", col= colDarkBlue, cex = 1.5)
lines(c(z,z), dnorm(z, m, s)*c(0.01,0.99), lty=2, col= colDarkBlue)

z = 0.57
text(x = z+0.1, dnorm(z)*1.05, "QR", pos=3, col= colRed, cex = 1.5)
text(x = z - 0.5, y = -0.03, "z = 0.57", col= colRed, cex = 1.5)
lines(c(z,z), dnorm(z, m, s)*c(0.01,0.99), lty=2, col= colRed)

dev.off()

###

pdf("gre_VR.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 0.9)

m = 462
s = 119
l = 620
u = NA
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,u,M,NA))
text("VR", x = 1.75, y = 0.30, cex = 1.5)

dev.off()

###

pdf("gre_QR.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 0.9)

m = 584
s = 151
l = 670+40
u = NA
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,"670",M,NA))
text("QR", x = 1.75, y = 0.30, cex = 1.5)

dev.off()