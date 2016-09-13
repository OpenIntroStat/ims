pdf('carsTypeCapacityVenn.pdf', 3.5, 1.5)

par(mar=c(0.1,3,0.1,0.1))
plot(c(0.2,1.8), c(0,1), type='n', ylab="", axes=FALSE)
box()

z <- seq(0,2*pi, len=99)
x1 <- cos(z)/2+0.7
y1 <- sin(z)/3+0.5
lines(c(x1, x1[1]),c(y1, y1[1]))

x2 <- cos(z)/2+1.3
y2 <- sin(z)/3+0.5
lines(c(x2, x2[1]),c(y2, y2[1]))

text(0.7, 0.9, 'midsize')
text(1.3, 0.9, 'capacity of 6')
text(c(0.55, 1, 1.45), rep(0.57, 3), c(17, 5, 11), cex=1.3)
text(c(0.55, 1, 1.45), rep(0.41, 3), c('17/54', '5/54', '11/54'),
	cex=1, col='#888888'); text(1, 0.07, 'Other cars: 54-17-5-11 = 21')

dev.off()