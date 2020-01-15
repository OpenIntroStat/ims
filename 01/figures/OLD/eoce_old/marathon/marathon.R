setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/marathon")

library(openintro)
data(marathon)

# marathon_histBox

pdf("marathon_HistBox.pdf", height = 3, width = 4.5)
par(mar=c(3.6,2.2,0.5,0.5), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,2))

histPlot(marathon$Time, xlab = "Marathon times (in hrs)", ylab = "", yaxt = "n", border='#225588', col=fadeColor('#225588', '55'), axes = FALSE)
axis(1, at = seq(2,3.2,0.4))
axis(2, at = seq(0,20,10))
boxPlot(marathon$Time, ylim = c(2,3.2), axes = FALSE)
axis(2, at = seq(2,3.2,0.4))

dev.off()


# marathon_genderBox

pdf("marathon_genderBox.pdf", height = 3, width = 4.5)
par(mar=c(2,3.6,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.75)

boxPlot(marathon$Time, horiz = TRUE, fact = marathon$Gender, xlim = c(2,3.2), axes = FALSE)
axis(1, at = seq(2,3.2,0.4))
axis(2, at = c(1,2), labels = c("females","males"))

dev.off()

# marathon_genderTimeSeries

pdf("marathon_genderTimeSeries.pdf", height = 3, width = 9)
par(mar=c(2,3.8,0.5,0.5), las=1, mgp=c(2.7,0.7,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

COL = c("#225588", "#55000088")

plot(marathon$Time[marathon$Gender == "m"] ~ marathon$Year[marathon$Gender == "m"], xlab = "Year", ylab = "Marathon times (in hrs)", pch = 15, col = COL[1], ylim = c(2, 3.2), axes = F)

points(marathon$Time[marathon$Gender == "f"] ~ marathon$Year[marathon$Gender == "f"], xlab = "Year", ylab = "Marathon Times", pch = 16, col = COL[2])

axis(1)
axis(2, at = seq(2,3.2,0.4))

legend("topright", inset = 0, pch = c(15,16), col = COL, legend = c("Male", "Female"))

dev.off()