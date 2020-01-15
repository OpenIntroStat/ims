setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/smoking")

library(xtable)

library(openintro)
data(smoking)

# Histograms

pdf("smoking_amountHist.pdf", 7, 4.3)

par(mar=c(3.6,3.6,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(2,1), cex.axis = 1.5, cex.lab = 1.5)

histPlot(smoking$amtWeekends, xlab = "Amount Weekends", ylab = "", xlim = c(0,60), axes = FALSE, breaks = 30, fadeColor('#225588', '66'), border = '#225588')
axis(1, seq(0,60,10))
axis(2, seq(0,100,50))

histPlot(smoking$amtWeekdays, xlab = "Amount Weekdays", ylab = "", xlim = c(0,60), axes = FALSE, breaks = 30, fadeColor('#225588', '66'), border = '#225588')
axis(1, seq(0,60,10))
axis(2, seq(0,100,50))

dev.off()