library(openintro)
data(COL)
data(textbooks)
set.seed(1)


myPDF("textbook_histogram_for_bootstrap_section.pdf",
      5.5, 3.3,
      mgp=c(1.7, 0.5, 0), mar=c(3, 2, 0.5, 0.5))
histPlot(textbooks$diff, breaks = 15,
         xlab="UCLA price - Amazon price, by book (USD)",
         ylab = "",
         col = COL[1])
axis(1)
dev.off()

Boot <- function(x, N = 10000, FUN = sd) {
  M <- matrix(sample(x, length(x) * N, TRUE), nrow = N)
  return(apply(M, 1, FUN))
}

x <- Boot(textbooks$diff)
s <- sd(textbooks$diff)

myPDF("textbook_sd_dist.pdf", 5.5, 3.3,
      mgp=c(1.7, 0.5, 0), mar=c(3, 4.1, 0.5, 0.5))
histPlot(x, breaks = 30, probability = TRUE,
         xlab="Standard Deviations of Bootstrap Samples",
         ylab = "",
         col = COL[1])
par(las = 0)
mtext("Density", 2, 3)
axis(1)
dev.off()


myPDF("textbook_sd_qqnorm.pdf", 7, 5.5,
      mgp=c(1.7, 0.5, 0), mar=c(3, 4.1, 0.5, 0.5))
qqnorm(x, main = "",
       ylab="Values From Bootstrap Distribution",
       col = COL[1,4], pch = 20)
dev.off()


