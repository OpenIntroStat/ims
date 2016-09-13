library(openintro)
data(COL)

myPDF('venn.pdf', 2.95, 1.75, mar=c(0.2, 0.2, 0.6, 0.2))
plot(c(0.2,1.8), c(0,1), type='n', axes=FALSE)
box()

z <- seq(0,2*pi, len=99)
x1 <- cos(z)/2+0.7
y1 <- sin(z)/3+0.5
lines(c(x1, x1[1]),c(y1, y1[1]))

x2 <- cos(z)/2+1.3
y2 <- sin(z)/3+0.5
lines(c(x2, x2[1]),c(y2, y2[1]))

text(0.7, 0.9, 'Diamonds')
text(1.3, 0.9, 'Face cards')
text(c(0.55, 1, 1.45), rep(0.57, 3), c(10, 3, 9), cex=c(1.3, 1.2, 1.3))
text(c(0.55, 1, 1.45), c(0.41, 0.43, 0.41), c('0.1923', '0.0577', '0.1731'),
	cex=c(1,0.9,1), col=COL[1])
text(1, 0.07, 'Other cards: 30')
text(1.56, 0.06, '(0.5769)', col=COL[1])
dev.off()