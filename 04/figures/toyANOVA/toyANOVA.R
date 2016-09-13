library(xtable)
library(openintro)
data(COL)
theSeed <- 7

gps <- c("I", "II", "III")
g   <- as.factor(rep(gps, c(20, 10, 40)))
M   <- c(1, 2, 1.5)
names(M) <- gps

set.seed(theSeed)
X1  <- rnorm(length(g), M[g], 1.5)
set.seed(theSeed)
X2  <- rnorm(length(g), M[g], 0.5)
for(i in gps){
	X1[g==i] <- X1[g==i] - mean(X1[g==i]) + mean(X2[g==i])
}
by(X1, g, mean)
by(X2, g, mean)


myPDF("toyANOVA.pdf", mar=c(1.7, 3.1, 0.5, 0.5), mgp=c(2, 0.5, 0))
plot(c(X1, X2), xlim=c(0.5, 6.5), type="n", axes=FALSE, xlab="", ylab="outcome")
rect(-100, -100, 100, 100, col=COL[7,3])
abline(h=seq(-10, 10, 2), col="#FFFFFF", lwd=3)
abline(h=seq(-10, 10, 1), col="#FFFFFF", lwd=0.8)
dotPlot(X1, g, TRUE, at=1:3, add=TRUE, col=COL[1,3], cex=0.9, pch=19)
dotPlot(X2, g, TRUE, at=1:3+3., add=TRUE, col=COL[4,3], cex=0.9, pch=19)
abline(v=3.5, col=COL[7], lwd=5.5)
abline(v=3.5, col="#AAAAAA", lwd=3)
abline(v=3.5, col="#333333", lwd=0.8)
axis(2)
par(mgp=c(2, 0.45, 0.1))
axis(1, at=1:3, gps)
axis(1, at=4:6, c("IV", "V", "VI"))
box()
dev.off()

xtable(anova(lm(X1 ~ g)))
xtable(anova(lm(X2 ~ g)))
