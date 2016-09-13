
library(openintro)
data(email50)
data(COL)

myPDF("email50LinesCharacters.pdf", 6, 3.3, mar=c(3, 3.9, 0.5, 1.2), mgp=c(2.8, 0.5, 0))
plot(email50$num_char, email50$line_breaks, pch=19, cex=1.3, col=COL[1,4], xlab="", ylab="Number of Lines", axes=FALSE)
axis(2)
axis(1)
box()
points(email50$num_char, email50$line_breaks, cex=1.3, col=COL[1,1])
mtext("Number of Characters (in thousands)", 1, 1.9)

dev.off()

