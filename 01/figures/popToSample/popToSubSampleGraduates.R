library(openintro)
data(COL)

set.seed(52)
myPDF("popToSubSampleGraduates.pdf", 4, 2.1, mar=c(0,0,0,0))

plot(c(0,2), c(0,1.1), type='n', axes=F)
temp <- seq(0, 2*pi, 2*pi/100)
x <- 0.5+0.5*cos(temp)
y <- 0.5+0.5*sin(temp)
lines(x,y)

s <- matrix(runif(700), ncol=2)
S <- matrix(NA, 350, 2)
j <- 0
sub <- rep(FALSE, 1000)
for(i in 1:dim(s)[1]){
	if(sum((s[i,] - .5)^2) < .23){
		j <- j+1
		S[j,] <- s[i,]
	}
	if(sum((s[i,]-c(0.05, 0.18)-.5)^2) < .07){
		sub[j] <- TRUE
	}
}
points(S, col=COL[4,4-2*sub], pch=20)
text(0.5, 1, 'all graduates', pos=3)
lines((x-0.5)*2*sqrt(0.07)+0.55,(y-.5)*2*sqrt(0.07)+0.68)

set.seed(7)
N <- sample((1:j)[sub], 25)
lines((x-0.5)/2+1.5, (y-.5)/2+.5, pch=20)

SS <- (S[N,]-0.5)/2 + 0.5
points(SS[c(2, 5, 7, 15),1]+1, SS[c(2, 5, 7, 15),2], col=COL[1,2], pch=20, cex=1.5)
text(1.5, 0.75, 'sample', pos=3)

for(i in c(2, 5, 7, 15)){
	arrows(S[N[i],1], S[N[i],2], SS[i,1]+1-0.03, SS[i,2], length=0.08, col=COL[5], lwd=1.5)
}
rect(0.143, 0.2, 0.952, 0.301, border="#00000000", col="#FFFFFF88")
rect(0.236, 0.301, 0.858, 0.403, border="#00000000", col="#FFFFFF88")
text(0.55, 0.5+0.18-sqrt(0.07), 'graduates from\nhealth-related fields', pos=1)

dev.off()