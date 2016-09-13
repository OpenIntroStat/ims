setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/02/figures/eoce/poorLang")

source("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/02/figures/eoce/poorLang/vennDiagPerc")

venn.diagram.perc(
	x = list(
		belowPL = (1:146),
		speakLOE = (105:311)
		),
	filename = "poorLang.tiff",
	lwd = 2,
	fill = c(fadeColor(oiB,33), fadeColor(oiB,66)),
	alpha = 0.9,
	label.col = "#225588",
	cex = 3,
	fontfamily = "serif",
	fontface = "bold",
	cat.col = c(fadeColor(oiB,66), oiB),
	cat.cex = 3,
	cat.fontfamily = "sans-serif",
	cat.dist = c(0.03, 0.03),
	cat.pos = c(-19, 14),
	margin = c(0,0,0,0),
	main.pos = c(0.5,0.05),
	main = "0.689",
	main.cex = 4,
	main.fontface = "bold",
	main.fontfamily = "serif",
	main.col = "#225588"
	)
