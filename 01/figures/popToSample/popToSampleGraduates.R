library(openintro)
data(COL)



set.seed(52)
myPDF("popToSampleGraduates.pdf", 4, 2.1, mar=c(0,0,0,0))

plot(c(0,2), c(0,1.1), type='n', axes=F)
temp <- seq(0, 2*pi, 2*pi/100)
x <- 0.5+0.5*cos(temp)
y <- 0.5+0.5*sin(temp)
lines(x,y)

s <- matrix(runif(700), ncol=2)
S <- matrix(NA, 350, 2)
j <- 0
for(i in 1:dim(s)[1]){
	if(sum((s[i,] - .5)^2) < .23){
		j <- j+1
		S[j,] <- s[i,]
	}
}
points(S, col=COL[4,3], pch=20)
text(0.5, 1, 'all graduates', pos=3)

set.seed(50)
N <- sample(j, 25)
lines((x-0.5)/2+1.5, (y-.5)/2+.5, pch=20)

SS <- (S[N,]-0.5)/2 + 0.5
points(SS[c(2,5,11,10,12),1]+1, SS[c(2,5,11,10,12),2], col=COL[1,2], pch=20, cex=1.5)
text(1.5, 0.75, 'sample', pos=3)

for(i in c(2,5,11,10,12)){
	arrows(S[N[i],1], S[N[i],2], SS[i,1]+1-0.03, SS[i,2], length=0.08, col=COL[5], lwd=1.5)
}

dev.off()