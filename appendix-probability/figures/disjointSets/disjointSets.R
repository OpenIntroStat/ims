library(openintro)
data(COL)

pdf('disjointSets.pdf', 3.35, 0.8)

par(mar=rep(0,4))
plot(c(0.05,0.95), c(0.13,0.82), type='n', axes=F)

for(i in 1:6){
	text(i/7, 0.5, i)
}
theta <- seq(0,2*pi,length.out=100)

#===> A <===#
lines(1/7*cos(theta)+1.5/7, 1/6*sin(theta)+0.5, col=COL[1])
text(1.5/7, 0.75, 'A', col=COL[1])

#===> B <===#
x <- 1/15*cos(seq(3*pi/2, 3*pi-0.3, length.out=40))+6/7
y <- 1/6*sin(seq(3*pi/2, 3*pi, length.out=40))+0.5
x <- c(x, seq(11/14, 9/14, length.out=10))
y <- c(y, seq(-0.3, 0.3, length.out=10)^2+0.4)
x <- c(x, 1/15*cos(seq(0.3, 3*pi/2, length.out=40))+4/7)
y <- c(y, 1/6*sin(seq(0, 3*pi/2, length.out=40))+0.5)
x <- c(x, x[1])
y <- c(y, y[1])
lines(x, y, lty=2, col=COL[2])
text(5/7, 0.2, 'B', col=COL[2])

#===> D <===#
lines(1/7*cos(theta)+2.5/7, 1/6*sin(theta)+0.5, lty=3, col=COL[4], lwd=2.425)
text(2.5/7, 0.75, 'D', col=COL[4])

dev.off()