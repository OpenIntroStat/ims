setwd("~/Desktop/Open Intro/EOCE - Second Edition/08/figures/eoce/gpa")

gpa = read.csv("gpa.csv")

lmGPA = lm(gpa ~ studyweek + sleepnight + out + gender, data = gpa)

xtable(summary(lmGPA), digits = 2)


# diagnostics for lmGPA


# normal prob plot for residuals

pdf("lmGPANormProbRes.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

qqnorm(lmGPA$residuals, ylab = "Residuals", cex.lab = 1.5, cex.axis = 1.5, pch = 19, main = "", col = COL[1])
qqline(lmGPA$residuals)

dev.off()

# absolute values of residuals against fitted

pdf("lmGPAAbsResFit.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(abs(lmGPA$residuals) ~ lmGPA$fitted.values, pch=19, col=COL[1], cex.lab = 1.5, ylab = "Absolute values of residuals", xlab = "Fitted values", axes = FALSE)
axis(1, seq(4,10,2), cex.axis = 1.5)
axis(2, seq(0,6,2), cex.axis = 1.5)
box()

dev.off()

# residuals in order of their data collection

pdf("lmGPAResOrder.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmGPA$residuals ~ c(1:length(lmGPA$residuals)), pch=19, col=COL[1], cex.lab = 1.5, ylab = "Residuals", xlab = "Order of collection", axes = FALSE)
axis(1, seq(0,80,40), cex.axis = 1.5)
axis(2, seq(-6,2,4), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# residuals against each predictor

# iq

pdf("lmGPAResIQ.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmGPA$residuals ~ edu$iq, pch=19, col=COL[1], cex.lab = 1.5, ylab = "Residuals", xlab = "IQ", axes = FALSE)
axis(1, seq(75,125,25), cex.axis = 1.5)
axis(2, seq(-6,2,4), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# gender

pdf("lmGPAResGender.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmGPA$residuals ~ edu$gender, pch=19, col=COL[1], cex.lab = 1.5, ylab = "Residuals", xlab = "Gender", axes = FALSE, xlim = c(-0.1,1.1))
axis(1, seq(0,1,1), cex.axis = 1.5)
axis(2, seq(-6,2,4), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()