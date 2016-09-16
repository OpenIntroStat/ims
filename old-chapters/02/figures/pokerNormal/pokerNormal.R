library(openintro)
data(COL)
set.seed(2014)

#===> data <===#
obs <- c(-110, -9, -60, 316, -200, -196, 320, -160, 31, 331, 1731, 21, -926, -475, 914, -300, -15, 1, -29, 829, 761, 227, -141, -672, 352, 385, 24, 103, -826, 95, 115, 39, -9, -1000, -35, -200, -200, 235, 70, 307, 135, 60, -100, -295, -1000, 361, -95, 337, 3712, -255)

M  <- mean(obs)
SD <- sd(obs)
x <- seq(min(obs)-3000, max(obs)+3000, 1)
y <- dnorm(x, M, SD)

myPDF("pokerNormal.pdf", 6.5, 2.7, mfrow = c(1, 2),
      mgp = c(2, 0.5, 0), mar = c(3, 0.5, 0.5, 2))
histPlot(obs, xlab = 'Poker Earnings (US$)',
         ylab = '', axes = FALSE, main = '',
         xlim = c(-2000, 4000), probability = TRUE,
         col=COL[1])
axis(1, cex.axis = 0.7, mgp = c(2, 0.35, 0))
lines(x, y, lwd = 1.5)

par(mar = c(3, 2, 0.5, 0.5), mgp=c(2.8, 0.5, 0), cex.axis=0.8)
qqnorm(obs, cex=0.5, main='', axes=FALSE, ylab='', xlab='', col = COL[1])
mtext('Theoretical Quantiles', line=2, side=1)
axis(1)
axis(2)
# abline(M, SD)
dev.off()


M
SD



myPDF("pokerNormal_bootstrap.pdf", 8, 2.2, mfrow = c(1, 3),
      mgp = c(2, 0.5, 0), mar = c(3, 0.5, 0.5, 2))
histPlot(obs, xlab = 'Poker Earnings (US$)',
         ylab = '', axes = FALSE, main = '',
         xlim = c(-2000, 4000), probability = TRUE,
         col=COL[1])
axis(1, cex.axis = 0.7, mgp = c(2, 0.35, 0))

X <- matrix(sample(obs, length(obs) * 1e4, TRUE), 1e4)
sds <- apply(X, 1, sd)
histPlot(sds, main='', axes=FALSE, ylab='', xlab='',
         col = COL[1])
axis(1, cex.axis = 0.7, mgp = c(2, 0.35, 0))
axis(2, cex.axis = 0.7, mgp = c(2, 0.35, 0))
mtext('Bootstrap Distribution of Standard Deviation', line=2, side=1, cex = 0.7)
# abline(M, SD)

par(mar = c(3, 2, 0.5, 0.5), mgp=c(2.8, 0.5, 0), cex.axis=0.8)
qqnorm(sds, cex = 0.5, col = COL[1,4], pch = 19, main = '')
mtext('Theoretical Quantiles', line=2, side=1, cex = 0.7)
axis(1)
axis(2)
dev.off()
