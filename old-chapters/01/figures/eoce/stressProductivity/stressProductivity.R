setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/stressProductivity")

pdf("stressProductivity.pdf", 5.5, 4.3)
par(mar=c(2.2,2.2,0.5,0.5), mgp=c(1,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

curve(rev(dgamma(x, 2.5,1/2)), 0, 14, xaxt = "n", yaxt = "n", xlab = "stress", ylab = "productivity", cex.lab = 1.75)

dev.off()