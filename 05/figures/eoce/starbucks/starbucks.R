setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/starbucks")

sb = read.csv("starbucks.csv")

###

pdf("carb_cals.pdf", 5.5, 7)

lmPlot(sb$calories, sb$carb, col = fadeColor(COL[1],90), xlab="Calories", ylab="Carb (in grams)", lCol = COL[2], lwd = 2, resSymm = TRUE, xAxis = 6, resAxis = 3, cex.lab = 1.25, cex.axis = 1.25)

dev.off()

##

lmSbuxCarb = lm(sb$carb ~ sb$calories)

###

pdf("carb_cals_res_hist.pdf", 5.5, 4.3)

par(mar=c(3.6,3,1,1), las=1, mgp=c(2.5,0.8,0))

histPlot(lmSbuxCarb$res, xlab = "Residuals", ylab = "", cex.lab = 1.5, cex.axis = 1.5, axes = FALSE, col = COL[1])

axis(1, c(-30, -15, 0, 15, 30), cex.axis = 1.5)
axis(2, c(0, 5, 10, 15,20,25), cex.axis = 1.5)

dev.off()

###


###

pdf("pro_cals.pdf", 5.5, 7)

lmPlot(sb$calories, sb$protein, col = fadeColor(COL[1],90), xlab="Calories", ylab="Protein (in grams)", lCol = COL[2], lwd = 2, resSymm = TRUE, resAxis = 3, xAxis = 6, cex.lab = 1.25, cex.axis = 1.25)

dev.off()

