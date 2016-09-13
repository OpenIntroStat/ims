setwd("~/Desktop/Open Intro/EOCE - Second Edition/08/figures/eoce/education")

edu = read.csv("education.csv")
edu$gender[edu$gender == 2] = 0

lmEdu = lm(gpa ~ iq + gender, data = edu)

xtable(summary(lmEdu), digits = 2)


# diagnostics for lmEdu


# normal prob plot for residuals

pdf("lmEduNormProbRes.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

qqnorm(lmEdu$residuals, ylab = "Residuals", cex.lab = 1.5, cex.axis = 1.5, pch = 19, main = "", col = COL[1])
qqline(lmEdu$residuals)

dev.off()

# absolute values of residuals against fitted

pdf("lmEduAbsResFit.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(abs(lmEdu$residuals) ~ lmEdu$fitted.values, pch=19, col=COL[1], cex.lab = 1.5, ylab = "Absolute values of residuals", xlab = "Fitted values", axes = FALSE)
axis(1, seq(4,10,2), cex.axis = 1.5)
axis(2, seq(0,6,2), cex.axis = 1.5)
box()

dev.off()

# residuals in order of their data collection

pdf("lmEduResOrder.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmEdu$residuals ~ c(1:length(lmEdu$residuals)), pch=19, col=COL[1], cex.lab = 1.5, ylab = "Residuals", xlab = "Order of collection", axes = FALSE)
axis(1, seq(0,80,40), cex.axis = 1.5)
axis(2, seq(-6,2,4), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# residuals against each predictor

# iq

pdf("lmEduResIQ.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmEdu$residuals ~ edu$iq, pch=19, col=COL[1], cex.lab = 1.5, ylab = "Residuals", xlab = "IQ", axes = FALSE)
axis(1, seq(75,125,25), cex.axis = 1.5)
axis(2, seq(-6,2,4), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# gender

pdf("lmEduResGender.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmEdu$residuals ~ edu$gender, pch=19, col=COL[1], cex.lab = 1.5, ylab = "Residuals", xlab = "Gender", axes = FALSE, xlim = c(-0.1,1.1))
axis(1, seq(0,1,1), cex.axis = 1.5)
axis(2, seq(-6,2,4), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()