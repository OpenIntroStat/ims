library(openintro)
data(COL)

GeneratePlot <- function(X, Y, label, start = -10, end = 10) {
  plot(X, Y,
       type = 'l',
       axes = FALSE,
       xlim = c(-3.4, 3.4))
  axis(1,
       at = c(-5, 0, 5),
       label = c(-5, label, 5),
       cex.axis = 0.7,
       tick = FALSE)
  these <- which(start < X & X < end)
  polygon(c(X[these[1]], X[these],X[rev(these)[1]]),
          c(0, Y[these], 0),
          col = COL[1])
  lines(X, Y)
  abline(h = 0)
  lines(c(0, 0),
        dnorm(0) * c(0.01, 0.99),
        col = COL[1],
        lty = 3)
}

X <- seq(-4, 4, 0.01)
Y <- dnorm(X)

myPDF('normalTails.pdf', 4.5, 1.3,
      mar = c(1.3, 1, 0.5, 1),
      mgp = c(3, -0.2, 0),
      mfrow = 1:2)
GeneratePlot(X, Y, "Negative Z", -10, -0.801)
GeneratePlot(X, Y, "Positive Z", -10, 0.801)
dev.off()



myPDF('normalTailLeft.pdf', 2.75, 1.05,
      mar = c(0.9, 1, 0.1, 3.05),
      mgp = c(3, -0.2, 0))
GeneratePlot(X, Y, "Negative Z", -10, -0.801)
dev.off()


myPDF('normalTailRight.pdf', 2.75, 1.05,
      mar = c(0.9, 2.9, 0.1, 1),
      mgp = c(3, -0.2, 0))
GeneratePlot(X, Y, "Positive Z", -10, 0.801)
dev.off()
