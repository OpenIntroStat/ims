require(openintro)
set.seed(2)

myPDF('varyingDegreesOfSkew.pdf', 6, 7.5, mgp=c(0.55, 0.55, 0))
M <- matrix(1:15, 5, byrow=TRUE)
layout(M, c(1,2,2), c(1.5, 5, 5, 5, 5))

#_____ Headings _____#
par(mar=rep(0,4))
plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)

par(mar=rep(0,4))
plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
text(0.5, 0.5, "Distribution example\n(exact distributions are\nnever actually observed)")

par(mar=rep(0,4))
plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
text(0.5, 0.5, "Sample observations")


# #_____ Normal _____#
# par(mar=rep(0,4))
# plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
# text(0.5, 0.5, "Normally distributed\n(2+ observations)")

# par(mar=c(2,1,1,2.5))
# X <- seq(-5, 5, 0.01)
# Y <- dnorm(X)
# plot(X, Y, type="l", xlab="", ylab="", axes=FALSE, xlim=c(-3.8, 3.8))
# axis(1, at=-4:4, labels=rep("", 9))
# abline(h=0)

# par(mar=c(2,3.2,1,0.3))
# x <- rnorm(7)
# histPlot(x, axes=FALSE, ylab="", xlab="7 observations")
# axis(2, 0:5)
# rug(x)

# #_____ Symmetric _____#
# par(mar=rep(0,4))
# plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
# text(0.5, 0.5, "Symmetric, no outliers\n(5+ observations)")
# par(mar=c(2,0,1,2))

# par(mar=c(2,1,1,2.5))
# X    <- seq(-5, 5, 0.01)
# Y    <- dt(X, 10) + dunif(X, -2, 2)
# plot(X, Y, type="l", xlab="", ylab="", axes=FALSE, xlim=c(-4, 4))
# axis(1, at=-4:4, labels=rep("", 9))
# abline(h=0)

# par(mar=c(2,3.2,1,0.3))
# x <- rnorm(10)
# histPlot(x, axes=FALSE, ylab="", xlab="10 observations")
# axis(2, 0:5)
# rug(x)


#_____ Slight skew _____#
par(mar=rep(0,4))
plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
text(0.5, 0.5, "Slight skew,\nno outliers\n(10+ observations)")
par(mar=c(2,0,1,2))

par(mar=c(2,1,1,2.5))
X    <- seq(-5, 12, 0.025)
Y    <- dnorm(X) + dnorm(X, 1, 1.5) + dnorm(X, 2, 2.25)
plot(X, Y, type="l", xlab="", ylab="", axes=FALSE, xlim=c(-4, 10))
abline(h=0)

par(mar=c(2,3.2,1,0.3))
x <- rnorm(10)
histPlot(x, axes=FALSE, ylab="", xlab="10 observations")
axis(2, 0:5)
rug(x)


#_____ Moderate skew _____#
par(mar=rep(0,4))
plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
text(0.5, 0.5, "Moderate skew,\nno outliers\n(20+ observations)")
par(mar=c(2,0,1,2))

par(mar=c(2,1,1,2.5))
X    <- seq(-5, 15, 0.1)
Y    <- dnorm(X) + dnorm(X, 1.25, 1.5) + dnorm(X, 3, 2.25) + dnorm(X, 5, 3)
plot(X, Y, type="l", xlab="", ylab="", axes=FALSE, xlim=c(-4, 13))
abline(h=0)

par(mar=c(2,3.2,1,0.3))
x <- rnorm(10)
histPlot(x, axes=FALSE, ylab="", xlab="20 observations")
axis(2, 0:5)
rug(x)


#_____ Strong skew _____#
par(mar=rep(0,4))
plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
text(0.5, 0.5, "Strong skew,\nmay contain\nmoderate outliers\n(50+ observations)")
par(mar=c(2,0,1,2))

par(mar=c(2,1,1,2.5))
X    <- seq(0, 12, 0.05)
Y    <- dgamma(X, 1.2, 1.1)*(X+1) + ifelse(X>0, dnorm(X, 1, 2.5), 0)
plot(X, Y, type="l", xlab="", ylab="", axes=FALSE, xlim=c(0, 10))
abline(h=0)

par(mar=c(2,3.2,1,0.3))
x <- rnorm(10)
histPlot(x, axes=FALSE, ylab="", xlab="10 observations")
axis(2, 0:5)
rug(x)


dev.off()