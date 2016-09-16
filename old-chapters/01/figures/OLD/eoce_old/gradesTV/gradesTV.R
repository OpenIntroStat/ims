setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/gradesTV")

library(openintro)
data(gradesTV)

COL <- "#225588"


pdf("gradesTV.pdf", 5.5, 4.3)

par(mar=c(3.6,3.6,1,1), las=1, mgp=c(2.5,0.7,0))

plot(gradesTV$Grades ~ gradesTV$TV, xlab='TV (hours)', ylab='Grades (out of 100)', pch=20, col=COL, cex.lab = 1.25, cex.axis = 1.15)

dev.off()