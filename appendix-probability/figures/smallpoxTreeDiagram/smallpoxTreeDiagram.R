library(openintro)

myPDF("smallpoxTreeDiagram.pdf", 7, 3.5)
treeDiag(c('Innoculated','Result'),c(0.0392, 0.9608),
	list(c(0.9754, 0.0246),c(0.8589, 0.1411)),
	textwd=0.2, solwd=0.35, cex.main=1.4,
	c('yes','no'),c('lived','died'), digits=5,
	col.main="#555555", showWork=TRUE)
dev.off()