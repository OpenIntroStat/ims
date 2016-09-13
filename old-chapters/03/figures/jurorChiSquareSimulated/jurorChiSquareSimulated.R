library(openintro)
data(COL)
set.seed(2)
p  <- c(0.72, 0.07, 0.12, 0.09)
N  <- 1e5
CC <- rmultinom(N, 275, p)
EE <- p*275
X2 <- colSums((CC - EE)^2/EE)



myPDF("jurorChiSquareSimulated.pdf", 6.6, 3.5, mgp=c(2, 0.5, 0), mar=c(3.1, 0.5, 0.5, 0.5))

histPlot(X2, COL[7], breaks=50, xlim=c(0,15), probability=TRUE, axes=FALSE, xlab=expression("Chi-square test statistic ("*X^2*")"), ylab="")
axis(1)
X <- c(seq(0, 1, 0.01), seq(1.1, 50, 0.1))
Y <- dchisq(X, 3)
lines(X, Y, col=COL[4], lwd=2.5)

arrows(5.89, 0.12, 5.89, 0.06, 0.1)
text(5.89, 0.12, expression("Observed "*X^2), pos=3)

dev.off()

pchisq(5.89, 3, lower.tail=FALSE)
mean(X2 >= 5.89)
