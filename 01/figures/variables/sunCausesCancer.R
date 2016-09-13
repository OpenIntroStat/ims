library(openintro)
data(COL)

myPDF("sunCausesCancer.pdf", 4.7, 1.2, mar=rep(0,4))
plot(c(-0.05,1.2),c(0.39,1),type='n',axes=FALSE)

text(0.59, 0.89, 'sun exposure')
rect(0.4,0.8,0.78,1)

text(0.3, 0.49, 'use sunscreen')
rect(0.1,0.4, 0.48, 0.6)
arrows(0.49, 0.78, 0.38, 0.62, length=0.08, lwd=1.5)

text(0.87, 0.5, 'skin cancer')
rect(0.71,0.4, 1.01, 0.6)
arrows(0.67, 0.78, 0.8, 0.62, length=0.08, lwd=1.5)

arrows(0.5, 0.5, 0.69, 0.5, length=0.08, col=COL[6,2])
#text(0.6, 0.495, 'X', cex=2, col=COL[4])
text(0.595, 0.565, "?", cex=1.5, col=COL[4])

dev.off()