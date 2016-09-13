library(openintro)


myPDF("lupusAndPositiveTestTreeDiagram.pdf", 6.5, 3)
treeDiag(c("Lupus", "Test result"), c(0.005, 0.995),
	list(c(0.99,0.01), c(0.02,0.98)),
	textwd=0.2, solwd=0.35, cex.main=1.4,
	c("Yes", "No"), c("Pos.", "Neg."), digits=5,
	col.main="#555555", showWork=TRUE)
dev.off()
