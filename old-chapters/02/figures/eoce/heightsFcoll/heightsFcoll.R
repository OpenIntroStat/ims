library(openintro)
data(COL)

heights = c(54, 55, 56, 56, 57, 58, 58, 59, 60, 60, 60, 61, 61, 62, 62, 63, 63, 63, 64, 65, 65, 67, 67, 69, 73)

cat(paste("\\stackrel{", 1:25, "}{", sort(heights), "}", sep=""), sep=", ")


###

pdf("heightsFcoll_hist.pdf", height = 4, width = 6)

par(mar=c(3.7,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.5, cex.axis = 1.5)

histPlot(heights, col = COL[1], xlab = "Heights", ylab = "", probability = TRUE, axes = FALSE, ylim = c(0,0.085))
axis(1)
#axis(2, labels = NA)

x = heights
xfit = seq(min(x)-5, max(x)+5, length = 400)
yfit = dnorm(xfit, mean = mean(x), sd = sd(x))
lines(xfit, yfit, col = COL[4], lwd = 2)

dev.off()

###

pdf("heightsFcoll_qq.pdf", height = 4, width = 6)

par(mar=c(3.7,3.7,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.5, cex.axis = 1.5)

qqnorm(heights, col = COL[1], pch = 19, main = "", axes = FALSE)
axis(1)
axis(2)
qqline(heights, col = COL[1,3])

dev.off()

