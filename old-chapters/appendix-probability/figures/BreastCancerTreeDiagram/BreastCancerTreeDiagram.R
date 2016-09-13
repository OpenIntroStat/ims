library(openintro)


myPDF("BreastCancerTreeDiagram.pdf", 7.5, 3)
treeDiag(c('Truth','Mammogram'),c(0.0035, 0.9965),
	list(c(0.89,0.11), c(0.07,0.93)),
	textwd=0.2, solwd=0.35, cex.main=1.4,
	c('cancer', 'no cancer'), c('positive','negative'), digits=5,
	col.main="#555555", showWork=TRUE)
dev.off()

