par(mar=rep(0,4))
plot(c(-0.05,1.2),c(0.3,1),type='n',axes=FALSE)

text(0.6, 0.9, 'two variables')
rect(0.4,0.8,0.8,1)

text(0.35, 0.5, 'associated')
rect(0.2,0.4, 0.5, 0.6)
arrows(0.5, 0.78, 0.4, 0.62, length=0.08)

text(0.8, 0.5, 'independent')
rect(0.63,0.4, 0.97, 0.6)
arrows(0.68, 0.78, 0.75, 0.62, length=0.08)
