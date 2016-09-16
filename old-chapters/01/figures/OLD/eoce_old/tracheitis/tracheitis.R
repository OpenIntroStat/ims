setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/tracheitis")

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

pdf("tracheitis_bar.pdf", height = 4, width = 8)
par(mar=c(4,11,0,0.5), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1))

barplot(sort(table(conditions))/sum(table(conditions)), ylab = "", xlab = "Relative frequency", border = '#225588', col = fadeColor('#225588', '33'), horiz = TRUE, las = 1,  cex.names = 1.25, cex.axis = 1.25, cex.lab = 1.25)

dev.off()

# pie chart

library(RColorBrewer)

pdf("tracheitis_pie.pdf", height = 4, width = 4)
par(mar=c(2,2,2,3), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1))

pie(table(conditions), col = fadeColor(brewer.pal(dim(table(conditions)),"Blues"), 66), cex = 1.15, labels = c("Cardio", "Gastro", "Gen/meta", "Immuno", "Neuro", "Premat", "Resp", "Trauma"), clockwise = TRUE)

dev.off()