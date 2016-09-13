library(openintro)
data(COL)

scores = c(79, 83, 57, 82, 94, 83, 72, 74, 73, 71, 66, 89, 78, 81, 78, 81, 88, 69, 77, 79)

cat(paste("\\stackrel{", 1:20, "}{", sort(scores), "}", sep=""), sep=", ")

###

pdf("scores_hist.pdf", height = 4, width = 6)

par(mar=c(3.7,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.5, cex.axis = 1.5)

histPlot(scores, col = COL[1], xlab = "Scores", ylab = "", probability = TRUE, axes = FALSE)
axis(1)
#axis(2, labels = NA)

x = scores
xfit = seq(min(x)-5, max(x)+5, length = 400)
yfit = dnorm(xfit, mean = mean(x), sd = sd(x))
lines(xfit, yfit, col = COL[4], lwd = 2)

dev.off()

###

pdf("scores_qq.pdf", height = 4, width = 6)

par(mar=c(3.7,3.7,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.5, cex.axis = 1.5)

qqnorm(scores, col = COL[1], pch = 19, main = "", axes = FALSE)
axis(1)
axis(2)
qqline(scores, col = COL[1,3])

dev.off()