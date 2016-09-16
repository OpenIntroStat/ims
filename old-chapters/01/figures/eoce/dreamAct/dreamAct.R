library(openintro)
data(COL)

ideology = c(rep("Conservative", 372), rep("Moderate", 363), rep("Liberal", 175))
ideology = factor(ideology, levels = c("Conservative", "Moderate", "Liberal"))
dream = c(rep("Yes", 186), rep("No", 151), rep("Not sure", 35), 
	rep("Yes", 174), rep("No", 161), rep("Not sure", 28),
	rep("Yes", 114), rep("No", 52), rep("Not sure", 9)
)
dream = factor(dream, levels = c("Yes", "No", "Not sure"))


# mosaicplot

pdf("dreamAct_mosaic.pdf", 5.5, 4.3)
par(mar=c(0.5,2,2,0.5), las=1, mgp=c(4,1,0))

mosaicplot(ideology ~ dream, main = "", cex.axis = 1.1, xlab = "", ylab = "", color = COL[c(4,1,2)])

mtext("Support DREAM Act", cex = 1.2, side = 2, adj = 0.5, las = 3)
mtext("Political ideology", cex = 1.2, side = 3, adj = 0.6, las = 1, padj = -0.5)

dev.off()