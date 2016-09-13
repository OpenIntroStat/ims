library(openintro)
data(COL)

d <- read.delim('NBA-heights_08-09.txt',sep='\t')
obs <- d[,4]

hold <- hist(obs, plot=FALSE)

myPDF("nbaNormal.pdf", 6, 2.5, mfrow=c(1,2), las=1, mgp=c(2,.5,0), mar=c(3, 0.5, 0.5, 2), cex.axis=0.8)
histPlot(obs, xlab='Height (inches)', ylab='', axes=FALSE, main='', xlim=c(69, 90), ylim=c(0,.12), col=COL[1], probability=TRUE)
axis(1)
M  <- mean(obs)
SD <- sd(obs)
x <- seq(min(obs)-2, max(obs)+2, 0.01)
y <- dnorm(x, M, SD)
lines(x, y, lwd=1.5)

par(mar=c(3, 2, 0.5, 0.5))
qqnorm(obs, cex=0.5, main='', axes=FALSE, ylab='NBA heights', xlab="Theoretical quantiles", col=COL[1])
axis(1)
axis(2)
abline(M, SD)

dev.off()