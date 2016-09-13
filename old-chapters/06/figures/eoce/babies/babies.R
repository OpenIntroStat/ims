setwd("~/Desktop/Open Intro/EOCE - Second Edition/08/figures/eoce/babies")

babies = read.csv("babies.csv")

xtable(summary(lm(bwt ~ smoke, data = babies)), digits = 2)

xtable(summary(lm(bwt ~ parity, data = babies)), digits = 2)

lmBabies = lm(bwt ~ gestation + parity + age + height + weight + smoke, data = babies)

xtable(summary(lmBabies), digits = 3)

eVar = round(var(lmBabies$residuals), 2)
yVar = round(var(babies$bwt), 2)

r2 = 1 - eVar/yVar

# drop age

lmBabies2 = lm(bwt ~ gestation + parity + height + weight + smoke, data = babies)

xtable(summary(lmBabies2), digits = 2)

# forward step 1

lmBabiesF1gest = lm(bwt ~ gestation, data = babies)
lmBabiesF1par = lm(bwt ~ parity, data = babies)
lmBabiesF1age = lm(bwt ~ age, data = babies)
lmBabiesF1ht = lm(bwt ~ height, data = babies)
lmBabiesF1wt = lm(bwt ~ weight, data = babies)
lmBabiesF1sm = lm(bwt ~ smoke, data = babies)

summary(lmBabiesF1gest)
summary(lmBabiesF1par)
summary(lmBabiesF1age)
summary(lmBabiesF1ht)
summary(lmBabiesF1wt)
summary(lmBabiesF1sm)

# diagnostics for lmBabies2

# normal prob plot for residuals

pdf("lmBabies2normProbRes.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

qqnorm(lmBabies2$residuals, ylab = "Residuals", cex.lab = 1.5, cex.axis = 1.5, pch = 19, main = "", col = fadeColor(COL[1],80))
qqline(lmBabies2$residuals)

dev.off()

# absolute values of residuals against fitted

pdf("lmBabies2ResFit.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ lmBabies2$fitted.values, pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Fitted values", axes = FALSE)
axis(1, seq(80,160,40), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# residuals in order of their data collection

pdf("lmBabies2resOrder.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ c(1:length(lmBabies2$residuals)), pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Order of collection", axes = FALSE)
axis(1, seq(0,1200,400), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# residuals against each predictor

babiesSub = babies[!is.na(babies$gestation) & !is.na(babies$parity) & !is.na(babies$height) & !is.na(babies$weight) & !is.na(babies$smoke),]


# gestation

pdf("lmBabies2resGest.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ babiesSub$gestation, pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Length of gestation", axes = FALSE)
axis(1, seq(150,350,50), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# parity

pdf("lmBabies2resParity.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ babiesSub$parity, pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Parity", axes = FALSE, xlim = c(-0.1,1.1))
axis(1, seq(0,1,1), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# height

pdf("lmBabies2resHgt.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ babiesSub$height, pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Height of mother", axes = FALSE)
axis(1, seq(55,70,5), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# weight

pdf("lmBabies2resWgt.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ babiesSub$weight, pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Weight of mother", axes = FALSE)
axis(1, seq(100,250,50), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()

# smoke

pdf("lmBabies2resSmoke.pdf", 5.5, 4.3)

par(mar=c(3.6,3.75,1,1), las=1, mgp=c(2.5,0.7,0))

plot(lmBabies2$residuals ~ babiesSub$smoke, pch=19, col=fadeColor(COL[1],80), cex.lab = 1.5, ylab = "Residuals", xlab = "Smoke", axes = FALSE, xlim = c(-0.1,1.1))
axis(1, seq(0,1,1), cex.axis = 1.5)
axis(2, seq(-40,40,40), cex.axis = 1.5)
abline(h = 0, lty = 2)
box()

dev.off()