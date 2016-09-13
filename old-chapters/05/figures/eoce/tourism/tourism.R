library(openintro)
data(COL)
tourism = read.csv("tourism.csv")

###

pdf("tourism_scat.pdf", 5, 7)
par(mgp=c(3.5, 0.55, 0))
lmPlot(tourism$visitor_count_tho, tourism$tourist_spending, col = fadeColor(COL[1],90), xlab = "Number of tourists (in thousands)", ylab = "Spending (in million $)", lCol = COL[2], lwd = 2, resSymm = TRUE, resAxis = 3, cex.lab = 1.25, cex.axis = 1.25, xAxis = 5) #, plots="resOnly")
#par(las=1)
#lmPlot(tourism$visitor_count_tho, tourism$tourist_spending, col = fadeColor(COL[1],90), xlab = "Number of tourists (in thousands)", ylab = "Spending (in million $)", lCol = COL[2], lwd = 2, resSymm = TRUE, resAxis = 3, cex.lab = 1.25, cex.axis = 1.25, xAxis = 5, yAxis=1, plots="resOnly", ylim=c(-1800, 1800))

dev.off()

###

lmTourism = lm(tourism$tourist_spending ~ tourism$visitor_count_tho)

###

pdf("tourism_resHist.pdf", 5.5, 4.3)

par(mar=c(4,2.7,1,1), las=1, mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(lmTourism$res, xlab = "Residuals", ylab = "", axes = FALSE, ylim = c(0,20), col = COL[1])

axis(1, c(-1500, -750, 0, 750, 1500))
axis(2, c(0, 10, 20))

dev.off()
