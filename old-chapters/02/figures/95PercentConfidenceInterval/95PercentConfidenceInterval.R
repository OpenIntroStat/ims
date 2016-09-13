library(openintro)
data(COL)
set.seed(15)

# _____ Run Simulations ____ #
num.sim <- 25
n       <- 300
p       <- 0.3
p.hat   <- rbinom(num.sim, n, p) / n
SE      <- sqrt(p.hat * (1 - p.hat) / n)

pdf('95PercentConfidenceInterval.pdf', 8, 4)

par(mar=c(2, 1, 1, 1), mgp=c(2.7, 0.9, 0))
xR <- p + 4*c(-1, 1)*max(SE)
yR <- c(0, 25)
plot(xR, yR, type='n', xlab='',
     ylab='', axes=FALSE)
abline(v=p, lty=2, col=COL[6])
axis(1, at=p + c(-0.05, 0, 0.05),
     c("0.25", "p = 0.30", "0.35"), cex.axis=1.15)
for(i in 1:num.sim){
	ci <- p.hat[i] + 2 * c(-1, 1) * SE[i]
	if(abs(p.hat[i] - p) > 2 * SE[i]){
		col <- COL[4]
		points(p.hat[i], i, cex=1.4, col=col)
	} else {
		col <- COL[1]
	}
	points(p.hat[i], i, pch=20, cex=1.2, col=col)
	lines(ci, rep(i, 2), col=col)
}
dev.off()

