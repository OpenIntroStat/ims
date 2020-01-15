library(openintro)
data(COL)
#setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/tracheitis")

conditions = c(rep("Prematurity", 33),
	rep("Neuromuscular", 10),
	rep("Cardiovascular", 16),
	rep("Genetic/metabolic", 6),
	rep("Respiratory", 13),
	rep("Trauma", 10),
	rep("Gastrointestinal", 2),
	rep("Immunocompromised", 2)
	)

# barplot

myPDF("tracheitis_bar.pdf", height = 3, width = 6, mar=c(3.2,9,0,0.5), las=1, mgp=c(2,0.45,0), mfrow = c(1,1))

barplot(sort(table(conditions))/sum(table(conditions)), ylab = "", xlab = "Relative frequency", border = '#225588', col = COL[1], horiz = TRUE)

dev.off()

# pie chart

library(RColorBrewer)
load("/Users/mine/Dropbox/oiStatistics/package/openintro/data/COL.rda")

pdf("tracheitis_pie.pdf", height = 4, width = 4)
par(mar=c(2,2,2,3), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1))

pie(table(conditions), col = c(COL[1,1],COL[1,4],COL[2,1],COL[2,4],COL[3,1],COL[3,4],COL[4,1],COL[4,4]), cex = 1.15, labels = c("Cardio", "Gastro", "Gen/meta", "Immuno", "Neuro", "Premat", "Resp", "Trauma"), clockwise = TRUE)

dev.off()