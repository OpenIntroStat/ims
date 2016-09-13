library(openintro)
data(email50)
data(COL)

myPDF("email50LinesCharactersMod.pdf", 4.5, 3.3, mar=c(3, 3.9, 0.5, 1.2), mgp=c(2.8, 0.5, 0))
plot(email50$num_char, email50$line_breaks, pch=19, cex=1.3, col=COL[1,4], xlab="", ylab="line_breaks", axes=FALSE)
axis(2)
labels = seq(0, 60, 10)
#labels[seq(2,6,2)] <- ""
axis(1, at=seq(0, 60, 10), labels=labels)
box()
points(email50$num_char, email50$line_breaks, cex=1.3, col=COL[1])
mtext("num_char", 1, 1.9)
dev.off()


myPDF("email50LinesCharactersModLog.pdf", 4.5, 3.3, mar=c(3, 2.9, 0.5, 1.2), mgp=c(1.8, 0.5, 0))
plot(log(email50$num_char), log(email50$line_breaks), pch=19, cex=1.3, col=COL[1,4], xlab="", ylab=expression(log[e](line_breaks)), axes=FALSE)
axis(2)
axis(1) #, at=seq(0, 60000, 10000), labels=labels)
box()
points(log(email50$num_char), log(email50$line_breaks), cex=1.3, col=COL[1])
mtext(expression(log[e](num_char)), 1, 1.9)
dev.off()



