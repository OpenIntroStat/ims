library(openintro)


myPDF('treeDiagramAndPass.pdf', 6, 2.7)
treeDiag(c('\nAble to construct\ntree diagrams','Pass class'), c(0.78,0.22),
	list(c(0.97,0.03),c(0.57,0.43)),
	textwd=0.2, solwd=0.35, cex.main=1.4,
	c('yes','no'),c('pass','fail'), digits=5,
	col.main="#555555", showWork=TRUE)
dev.off()
