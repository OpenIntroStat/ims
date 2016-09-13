library(openintro)
data(COL)

pdf('complementOfD.pdf', 4, 1.05)
par(mar=rep(0,4))
plot(c(-0.05,1), c(0.18,0.92), type='n', axes=F)

for(i in c(1,4,5,6)){
	text(i/7, 0.5, i)
}
for(i in 2:3){
	text(i/7, 0.55, i)
}
theta <- seq(0,2*pi,length.out=100)

#===> D <===#
lines(1/7*cos(theta)+2.5/7, 1/9*sin(theta)+0.55, lty=3, col=COL[4], lwd=2.425)
text(2.5/7, 0.75, 'D', col=COL[4])

#===> D^c <===#
x <- 1/20*cos(seq(0.5, 3*pi/2, length.out=20))+1/7
y <- 1/5*sin(seq(0.2, 3*pi/2, length.out=20))+0.5
x <- c(x, 1/20*cos(seq(-pi/2, pi/2, length.out=20))+6/7)
y <- c(y, 0.175*sin(seq(-pi/2, pi/2, length.out=20))+0.47)
x <- c(x, 1/20*cos(seq(pi/2, pi, length.out=10))+4/7)
y <- c(y, 1/5*sin(seq(pi/2, pi-0.5, length.out=10))+.45)
x <- c(x, seq(1/2, 3/14, length.out=10))
y <- c(y, seq(-0.35, 0.35, length.out=10)^2+0.33)
x <- c(x, x[1])
y <- c(y, y[1])
lines(x, y, lty=2, col=COL[2])
text(5/7, 0.75, expression(D^C), col=COL[2])

#===> S <===#
x <- 1/10*cos(seq(pi/2, 3*pi/2, length.out=20))+1/9
y <- 1/3*sin(seq(pi/2, 3*pi/2, length.out=20))+0.55
x <- c(x, 1/10*cos(seq(-pi/2, pi/2, length.out=20))+8/9)
y <- c(y, 1/3*sin(seq(-pi/2, pi/2, length.out=20))+0.55)
#x <- c(x, 1/20*cos(seq(pi/2, pi, length.out=10))+4/7)
#y <- c(y, 1/5*sin(seq(pi/2, pi-0.5, length.out=10))+.45)
#x <- c(x, seq(1/2, 3/14, length.out=10))
#y <- c(y, seq(-0.35, 0.35, length.out=10)^2+0.33)
x <- c(x, x[1])
y <- c(y, y[1])
lines(x, y, lty=1, col=COL[1])
text(0, 0.55, expression(S), col=COL[1], pos=2, cex=1.3)


dev.off()