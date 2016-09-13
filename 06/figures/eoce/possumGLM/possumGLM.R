library(openintro)
library(xtable)
data(COL)
data(possum)

Pop  <- ifelse(possum$pop == "Vic", 1, 0)
Sex  <- ifelse(possum$sex == "m", 1, 0)
xtable(glm(Pop ~ Sex + headL + skullW + totalL + tailL, binomial, possum))
xtable(glm(Pop ~ Sex + skullW + totalL + tailL, binomial, possum))


myPDF("possumVars.pdf", 8*0.9, 3.7*0.9, mfrow=c(2,3), mar=c(3.7, 3.5, 0.75, 0.75), mgp=c(2, 0.55, 0))

#_____ sex _____#
par(mar=c(3.7, 3.2, 0.75, 0.75))
histPlot(Sex, breaks=seq(-0.375, 1.375, 0.25), col=COL[1], axes=FALSE, xlab="", ylab="Frequency")
mtext("sex_male", 1, 2.5, cex=0.7)
axis(1, at=0:1, labels=c("0\n(Female)", "1\n(Male)"), mgp=c(2, 1.5, 0))
axis(2, at=seq(0, 60, 20))

#_____ head_length _____#
histPlot(possum$headL, breaks=15, col=COL[1], xlab="head_length (in mm)", ylab="Frequency")

#_____ skull_width _____#
histPlot(possum$skullW, breaks=15, col=COL[1], xlab="skull_width (in mm)", ylab="Frequency")

#_____ total_length _____#
histPlot(possum$totalL, breaks=18, col=COL[1], xlab="total_length (in cm)", ylab="Frequency", axes=FALSE)
axis(1)
axis(2, at=seq(0, 10, 5))

#_____ tail_length _____#
histPlot(possum$tailL, breaks=18, col=COL[1], xlab="tail_length (in cm)", ylab="Frequency")

#_____ population _____#
histPlot(Pop, breaks=seq(-0.375, 1.375, 0.25), col=COL[1], axes=FALSE, xlab="", ylab="Frequency")
axis(1, at=0:1, labels=c("0\n(Not Victoria)", "1\n(Victoria)"), mgp=c(2, 1.5, 0))
mtext("population", 1, 2.5, cex=0.7)
axis(2, at=seq(0, 60, 20))

dev.off()
