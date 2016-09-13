library(openintro)
data(COL)
set.seed(5)

height <- 4
width  <- 6


PHatPlot <- function(p, n, lwd = 3, type = "ignored",
    axes = "ignored", xlab = "", ylab = "", ...) {
  x <- seq(0, n)
  y <- dbinom(x, n, p)
  plot(x / n, y, type = "n", axes = FALSE,
       xlab = xlab, ylab = ylab, ...)
  x <- x[y > max(y) / 2000]
  y <- y[y > max(y) / 2000]
  segments(x / n, 0, x / n, y, col = COL[1], lwd = lwd)
  abline(h = 0)
  axis(1)
}

myPDF("eoce-p-hat-simulations-p5.pdf",
      height = height, width = width,
      mfrow = c(3, 1), mar = c(3, 0.5, 1, 0.5))
PHatPlot(0.5,  20, lwd = 7, xlim = c(0.1, 0.9))
PHatPlot(0.5, 100, lwd = 4, xlim = c(0.1, 0.9))
PHatPlot(0.5, 500, lwd = 1, xlim = c(0.1, 0.9))
dev.off()

myPDF("eoce-p-hat-simulations-p1.pdf",
      height = height, width = width,
      mfrow = c(3, 1), mar = c(3, 0.5, 1, 0.5))
PHatPlot(0.1,  20, lwd = 7, xlim = c(0, 0.4))
PHatPlot(0.1, 100, lwd = 5, xlim = c(0, 0.4))
PHatPlot(0.1, 500, lwd = 2, xlim = c(0, 0.4))
dev.off()

myPDF("eoce-p-hat-simulations-p95.pdf",
      height = height, width = width,
      mfrow = c(3, 1), mar = c(3, 0.5, 1, 0.5))
PHatPlot(0.95,  20, lwd = 7, xlim = c(0.7, 1))
PHatPlot(0.95, 100, lwd = 5, xlim = c(0.7, 1))
PHatPlot(0.95, 500, lwd = 2, xlim = c(0.7, 1))
dev.off()
