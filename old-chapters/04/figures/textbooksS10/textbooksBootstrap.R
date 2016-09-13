library(openintro)
library(xtable)
data(textbooks)
data(COL)

d <- textbooks
n <- length(d$diff)
N <- 1e4

set.seed(1)
x <- sample(n, n, TRUE)
X <- d$diff[x]
xtable(matrix(c(X, rep(NA, 4)), 7))

s <- sd(X)
for (i in 2:N) {
  s[i] <- sd(sample(d$diff, n, TRUE))
}
sd(s)

myPDF("textbookBootstrapSamplingForSD.pdf", 6, 3.3)
histPlot(s, COL[1], breaks = 25,
    xlab = "Standard Deviation",
    ylab = "Frequency")
dev.off()

myPDF("textbookBootstrapSamplingQQPlotForSD.pdf", 5, 4)
qqnorm(s, col = COL[1,4], pch = 20,
    main = "",
    ylab = "Bootstrap Distribution Quantiles")
dev.off()



