library(openintro)
data(COL)

myPDF('sampleLinesAndResPlots.pdf', 5, 2.5)

set.seed(1)

par(mfrow=2:3, mar=rep(0.5, 4))

MyLayOut <- matrix(1:6, 2)
nf <- layout(mat=MyLayOut, widths=c(2,2,2), heights=c(2,1), respect=TRUE)

n <- c(25)
x <- runif(n[1])
y <- -8*x + rnorm(n[1])
plot(x,y, axes=FALSE, pch=20, col=COL[1,2], cex=1.202, xlim=c(-0.03, 1.03), ylim=c(-10, 1))
box()
g <- lm(y~x)
abline(g, col=COL[5])
plot(x, summary(g)$residuals, pch=20, col=COL[1,2], cex=1.202, xlim=c(-0.03, 1.03), axes=FALSE, ylim=2.5*c(-1,1)*max(abs(summary(g)$residuals)))
box()
abline(h=0, col=COL[5], lty=2)

n <- 30
x <- c(runif(n[1]-2, 0, 4), 2, 2.1)
y <- -2*x^2 + rnorm(n[1])
plot(x,y, axes=FALSE, pch=20, col=COL[1,2], cex=1.202, xlim=c(-0.2, 4.2), ylim=c(-35, 2))
box()
g <- lm(y~x)
abline(g, col=COL[5])
plot(x, summary(g)$residuals, pch=20, col=COL[1,2], cex=1.202, xlim=c(-0.2, 4.2), axes=FALSE, ylim=1.8*c(-1,1)*max(abs(summary(g)$residuals)))
box()
abline(h=0, col=COL[5], lty=2)

n <- 40
x <- runif(n[1])
y <- 0.2*x + rnorm(n[1])
y[y < -2] <- -1.5
plot(x,y, axes=FALSE, pch=20, col=COL[1,2], cex=1.202, xlim=c(-0.03, 1.03), ylim=c(-2, 2))
box()
g <- lm(y~x)
abline(g, col=COL[5])
plot(x, summary(g)$residuals, pch=20, col=COL[1,2], cex=1.202, xlim=c(-0.03, 1.03), axes=FALSE, ylim=1.2*c(-1,1)*max(abs(summary(g)$residuals)))
box()
abline(h=0, col=COL[5], lty=2)




dev.off()