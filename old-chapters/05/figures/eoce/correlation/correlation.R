setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/correlation")

###

hus = c(30,31,32)
wife = hus - 3

pdf("husWifeA.pdf", 5.5, 4.3)

par(mar=c(4.5,4.5,0.5,0.5), las=1, mgp=c(3.2,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(wife ~ hus, xlab = "(a) Husband's Age", ylab = "Wife's Age", pch=19, col=COL[1], axes = FALSE)
axis(1, at = hus)
axis(2, at = wife)
box()

lines(c(min(hus),max(hus)),c(min(wife),max(wife)), lty = 3)

dev.off()

###

hus = c(30,31,32)
wife = hus + 2


pdf("husWifeB.pdf", 5.5, 4.3)

par(mar=c(4.5,4.5,0.5,0.5), las=1, mgp=c(3.2,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(wife ~ hus, xlab = "(b) Husband's Age", ylab = "Wife's Age", pch=19, col=COL[1], axes = FALSE)
axis(1, at = hus)
axis(2, at = wife)
box()

lines(c(min(hus),max(hus)),c(min(wife),max(wife)), lty = 3)
dev.off()

###

hus = c(60,61,62)
wife = hus / 2


pdf("husWifeC.pdf", 5.5, 4.3)

par(mar=c(4.5,4.5,0.5,0.5), las=1, mgp=c(3.2,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(wife ~ hus, xlab = "(c) Husband's Age", ylab = "Wife's Age", pch=19, col=COL[1], axes = FALSE)
axis(1, at = hus)
axis(2, at = wife)
box()

lines(c(min(hus),max(hus)),c(min(wife),max(wife)), lty = 3)

dev.off()

###

m = c(20000,30000,40000)
f = m - 5000

pdf("mfSalA.pdf", 5.5, 4.3)

par(mar=c(4.5,4.5,0.5,0.5), las=1, mgp=c(3.2,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(f ~ m, xlab = "(a) Males' salaries", ylab = "Females' salaries", pch=19, col=COL[1], axes = FALSE, xlim = c(18000,42000))
axis(1, at = m)
axis(2, at = f, las = 3)
box()

lines(c(min(m),max(m)),c(min(f),max(f)), lty = 3)

dev.off()

###

m = c(20000,30000,40000)
f = m / 1.25

pdf("mfSalB.pdf", 5.5, 4.3)

par(mar=c(4.5,4.5,0.5,0.5), las=1, mgp=c(3.2,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(f ~ m, xlab = "(b) Males' salaries", ylab = "Females' salaries", pch=19, col=COL[1], axes = FALSE, xlim = c(18000,42000))
axis(1, at = m)
axis(2, at = f, las = 3)
box()

lines(c(min(m),max(m)),c(min(f),max(f)), lty = 3)

dev.off()

###

m = c(20000,30000,40000)
f = m / 0.85

pdf("mfSalC.pdf", 5.5, 4.3)

par(mar=c(4.5,4.5,0.5,0.5), las=1, mgp=c(3.2,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(f ~ m, xlab = "(c) Males' salaries", ylab = "Females' salaries", pch=19, col=COL[1], axes = FALSE, xlim = c(18000,42000))
axis(1, at = m)
axis(2, at = f, las = 3)
box()

lines(c(min(m),max(m)),c(min(f),max(f)), lty = 3)

dev.off()