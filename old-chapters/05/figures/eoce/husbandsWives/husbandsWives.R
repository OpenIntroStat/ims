setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/husbandsWives")

hw = read.table("husbandsWives.txt", h = T, sep = "\t")

# convert height to inches

hw$Ht_Husband_in = hw$Ht_Husband / 25.4
hw$Ht_Wife_in = hw$Ht_Wife / 25.4

hwSub = hw[!is.na(hw$Age_Wife),]
hw = hwSub

###

pdf("husbandsWives_age.pdf", 5.5, 4.3)

par(mar=c(3.75,3.75,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(hw$Age_Wife ~ hw$Age_Husband, xlab="Husband's age (in years)", ylab="Wife's age (in years)", pch=19, col=fadeColor(COL[1],80), xlim = c(18, 66), ylim = c(16, 66), axes = FALSE)
axis(1, at = seq(20,60,20))
axis(2, at = seq(20,60,20))
box()

dev.off()

###

pdf("husbandsWives_height.pdf", 5.5, 4.3)

par(mar=c(3.75,3.75,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(hw$Ht_Wife_in ~ hw$Ht_Husband_in, xlab="Husband's height (in inches)", ylab="Wife's height (in inches)", pch=19, col=fadeColor(COL[1],80), xlim = c(60, 77), ylim = c(55, 70), axes = FALSE)
axis(1, at = seq(60,75,5))
axis(2, at = seq(55,70,5))
box()

dev.off()

###

# lm output

library(xtable)

xtable(summary(lm(hw$Age_Wife ~ hw$Age_Husband)))

xtable(summary(lm(hw$Ht_Wife_in ~ hw$Ht_Husband_in)))