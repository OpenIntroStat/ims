library(openintro)


myPDF('treeDiagramGarage.pdf', 7, 3.5)
treeDiag(c('Event','Garage full'), c(0.35,0.20,0.45),
	list(c(0.25,0.75),c(0.7,0.3),c(0.05,0.95)),
	textwd=0.22, solwd=0.35, cex.main=1.4,
	c('Academic','Sporting', 'None'),c('Full','Spaces Available'), digits=5,
	col.main="#555555", showWork=TRUE)
dev.off()
