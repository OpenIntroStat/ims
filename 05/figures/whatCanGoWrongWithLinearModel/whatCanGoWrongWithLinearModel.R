library(openintro)
source("makeTubeAdv.R")
data(COL)

# load the makeTube function (ch7 folder)
pch=20
cex=1.75
col='#22558888'

pdf('whatCanGoWrongWithLinearModel.pdf', 10, 2.8)
layout(matrix(1:8, 2), c(1,1,1,1), c(2,1))
#layout(matrix(c(1:2, 0, 5:6, 3:4, 0, 7:8), 5), c(1,1), c(2,1,0.3,2,1))
par(mar=rep(0.5, 4))

set.seed(1)
x <- runif(100)
y <- 25*x-20*x^2+rnorm(length(x), sd=1.5)
plot(x,y, axes=FALSE, pch=pch, cex=cex, col="#00000000")
box()
makeTube(x,y, type='Q', addLine=FALSE, col=COL[7,3])
points(x,y, pch=pch, cex=cex, col=COL[1,2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1,1)*diff(yR)/10
plot(x, g$residuals, axes=FALSE, pch=pch, cex=cex, col=COL[1,2], ylim=yR)
abline(h=0, lty=2)
box()

set.seed(2)
x <- c(-0.6, -0.46, -0.091, runif(97))
y <- 25*x + rnorm(length(x))
y[2] <- y[2] + 8
y[1] <- y[1] + 1
plot(x,y, axes=FALSE, pch=pch, cex=cex, col="#00000000")
box()
makeTube(x,y, addLine=FALSE, col=COL[7,3])
points(x,y, pch=pch, cex=cex, col=COL[1,2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1,1)*diff(yR)/10
plot(x, g$residuals, axes=FALSE, pch=pch, cex=cex, col=COL[1,2], ylim=yR)
abline(h=0, lty=2)
box()

set.seed(3)
x <- runif(100)
y <- 5*x + rnorm(length(x), sd=x)
plot(x,y, axes=FALSE, pch=pch, cex=cex, col="#00000000")
box()
makeTubeAdv(x, y, type='l', variance='l', bw=0.03, Z=1.7, col=COL[7,3])
#makeTube(x,y)
points(x,y, pch=pch, cex=cex, col=COL[1,2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1,1)*diff(yR)/10
plot(x, g$residuals, axes=FALSE, pch=pch, cex=cex, col=COL[1,2], ylim=yR)
abline(h=0, lty=2)
box()

library(stockPortfolio)
gr <- getReturns("MSFT", "day", start="2005-01-01", end="2005-05-01")
x <- 1:length(gr$R)
y <- cumprod(1+rev(gr$R))
plot(x,y, axes=FALSE, pch=pch, cex=cex, col="#00000000")
box()
makeTube(x,y, addLine=FALSE, col=COL[7,3])
points(x,y, pch=pch, cex=cex, col=COL[1,2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1,1)*diff(yR)/10
plot(x, g$residuals, axes=FALSE, pch=pch, cex=cex, col=COL[1,2], ylim=yR)
abline(h=0, lty=2)
box()

makeTubeAdv(x,y, col=COL[7,3])

dev.off()