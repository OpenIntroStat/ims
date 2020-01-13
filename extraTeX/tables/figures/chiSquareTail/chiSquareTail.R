library(openintro)
data(COL)

myPDF('chiSquareTail.pdf', 3.5, 2.1,
      mar = c(2, 1, 0.5, 1),
      mgp = c(3, 0.8, 0))
X <- seq(0, 25, 0.05)
Y <- dchisq(X, 3.5)

plot(X, Y, type = 'l', axes = FALSE, xlim = c(0, 15))
axis(1)
these <- which(X > 5.79)
polygon(c(X[these[1]], X[these], X[rev(these)[1]]),
        c(0, Y[these], 0), col = COL[1])
lines(X, Y)
abline(h = 0)
dev.off()
