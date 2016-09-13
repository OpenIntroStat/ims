library(openintro)
data(COL)

myPDF('variables.pdf', 4.2, 1.5, mar=rep(0,4))
plot(c(-0.15,1.3),0:1,type='n',axes=FALSE)

text(0.6, 0.9, 'all variables')
rect(0.4,0.8,0.8,1)

text(0.25, 0.5, 'numerical')
rect(0.1,0.4, 0.4, 0.6)
arrows(0.45, 0.78, 0.34, 0.62, length=0.08)

text(0.9, 0.5, 'categorical')
rect(0.73,0.4, 1.07, 0.6)
arrows(0.76, 0.78, 0.85, 0.62, length=0.08)

text(0, 0.1, 'continuous')
rect(-0.17, 0, 0.17, 0.2)
arrows(0.13, 0.38, 0.05, 0.22, length=0.08)

text(0.39, 0.1, 'discrete')
rect(0.25, 0, 0.53, 0.2)
arrows(0.35, 0.38, 0.4, 0.22, length=0.08)

text(0.77, 0.105, 'regular\ncategorical', col=COL[6], cex=0.7)
rect(0.64, 0, 0.9, 0.2, border=COL[6])
arrows(0.82, 0.38, 0.77, 0.22, length=0.08, col=COL[6])

text(1.12, 0.1, 'ordinal', col=COL[6])
rect(0.99, 0, 1.25, 0.2, border=COL[6])
arrows(1.02, 0.38, 1.1, 0.22, length=0.08, col=COL[6])

dev.off()