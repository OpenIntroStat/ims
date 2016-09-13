setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/02/figures/eoce/indepSwing")

source("vennDiagDec.R")

oiB = "#3E9BC0"

venn.diagram.perc(
	x = list(
		Independent = 1:35,
		Swing = 25:47
		),
	filename = "indepSwing.tiff",
	lwd = 2,
	fill = c(fadeColor(oiB,33), fadeColor(oiB,66)),
	alpha = 0.9,
	label.col = "#225588",
	cex = 4,
	fontfamily = "serif",
	fontface = "bold",
	cat.col = c(fadeColor(oiB,66), oiB),
	cat.cex = 3,
	cat.fontfamily = "sans-serif",
	cat.dist = c(0.03, 0.03),
	cat.pos = c(-10, 14),
	margin = c(0,0,0,0),
	main.pos = c(0.5,0.05),
	main = "0.53",
	main.cex = 4,
	main.fontface = "bold",
	main.fontfamily = "serif",
	main.col = "#225588"
	)