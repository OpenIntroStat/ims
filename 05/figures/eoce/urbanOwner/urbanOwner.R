library(openintro)
data(COL)
#setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/urbanOwner")

uo = read.csv("urbanOwner.csv")

###

pdf("urbanOwner_withDC.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(uo$pct_owner_occupied ~ uo$poppct_urban, xlab='% urban population', ylab='% who own home', pch=19, col=COL[1,2], cex=1.3)

dev.off()

###

# drop DC

uo_noDC = uo[uo$state != "District of Columbia",]

###


pdf("urbanOwner_withoutDC_noRes.pdf", 5.5, 4.3)

par(mar=c(4,5,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(uo_noDC$poppct_urban, uo_noDC$pct_owner_occupied, xlab='% urban population', ylab='% who own home', pch=20, col=COL[1])
abline(lm(uo_noDC$pct_owner_occupied~uo_noDC$poppct_urban), col = COL[2], lwd = 2)

dev.off()

###

pdf("urbanOwner_withoutDC.pdf", 5.5, 7)

lmPlot(uo_noDC$poppct_urban, uo_noDC$pct_owner_occupied, col = COL[1], xlab='% urban population', ylab='% who own home', lCol = COL[2], lwd = 2, resSymm = TRUE, resAxis = 3, xAxis = 5, yAxis = 5, cex.lab = 1.5, cex.axis = 1.5)

dev.off()