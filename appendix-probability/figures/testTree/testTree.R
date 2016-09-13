library(openintro)


myPDF('testTree.pdf', 6.5, 3.4)
treeDiag(c('Midterm','Final'), c(0.13,0.87),
	list(c(0.47,0.53),c(0.11,0.89)),
	textwd=0.2, solwd=0.35, cex.main=1.4,
	c('A','other'),c('A','other'), digits=5,
	col.main="#555555", showWork=TRUE)
dev.off()
