setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/gradesTV")

gradesTV = read.table("Grades vs. TV.txt", h = T, sep = "\t")


###

pdf("gradesTV.pdf", 5.5, 7)

lmPlot(gradesTV$TV, gradesTV$Grades, col = COL[1], xlab='TV (hours)', ylab='Grades (out of 100)', lCol = COL[2], lwd = 2, resSymm = TRUE, resAxis = 3, xAxis = 5, yAxis = 5, cex.lab = 1.25, cex.axis = 1.25)

dev.off()

###
