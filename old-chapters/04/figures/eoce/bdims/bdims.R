library(openintro)
library(xtable)
data(bdims)
data(COL)
set.seed(2014)

myPDF("bdims_heights.pdf", 6, 3,
      mar = c(3.7, 2, 1, 1), mgp=c(2.5, 0.7, 0),
      cex.lab = 1.25)
histPlot(bdims$hgt, col = COL[1],
         xlab = "Height", ylab = "")
dev.off()


s <- sd(bdims$hgt)
n <- nrow(bdims)
N <- 1e4
x <- sample(bdims$hgt, n * N, TRUE)
s.boot <- apply(matrix(x, N), 1, sd)

myPDF("bdims_heights_boot_sd.pdf", 9, 4,
      mfrow = c(1, 2))
histPlot(s.boot, breaks = 20, col = COL[1],
         xlab = "Standard Deviation (Bootstrap)",
         ylab = "Frequency")
qqnorm(s.boot, pch = 19, col = COL[1,4],
       main = "")
dev.off()

probs <- c(0.01, 0.025, 0.05, 0.1, 0.5,
           0.9, 0.95, 0.975, 0.99)
out <- quantile(s.boot, probs = probs)
xtable(rbind(out))

