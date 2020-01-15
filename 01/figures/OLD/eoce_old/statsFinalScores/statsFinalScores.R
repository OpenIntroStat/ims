setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/statsFinalScores")

scores = c(79, 83, 57, 82, 94, 83, 72, 74, 73, 71, 66, 89, 78, 81, 78, 81, 88, 69, 77, 79)

# statsFinalScores_hist

pdf("statsFinalScores_hist.pdf", height = 4, width = 6)
par(mar=c(3.6,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

histPlot(scores, ylab = "", xlab = "Scores", xlim = c(50,100), border = '#225588', col = fadeColor('#225588', '33'))

dev.off()

# statsFinalScores_box

pdf("statsFinalScores_box.pdf", height = 4, width = 4)
par(mar=c(3.6,2.2,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5)

boxPlot(scores, ylab = "Scores", ylim = c(50,100))
abline(h = 97.5, lty = 3)
abline(h = 57.5, lty = 3)
text(y = 99, x = 0.65, "UF = 97.5", cex = 0.75)
text(y = 59, x = 0.65, "LF = 57.5", cex = 0.75)

dev.off()