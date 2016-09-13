set.seed(52)
par(mar=c(0,0,0,0))

plot(c(0,2), c(0,1.1), type='n', axes=F)
temp <- seq(0, 2*pi, 2*pi/100)
x <- 0.5+0.5*cos(temp)
y <- 0.5+0.5*sin(temp)
lines(x,y)

COL <- c('#66112233', '#66112255', '#33559988', '#555555')
s <- matrix(runif(700), ncol=2)
S <- matrix(NA, 350, 2)
j <- 0
sub <- rep(FALSE, 250)
for(i in 1:dim(s)[1]){
	if(sum((s[i,] - .5)^2) < .23){
		j <- j+1
		S[j,] <- s[i,]
	}
	if(sum((s[i,]-c(0.1, 0.12)-.5)^2) < .025){
		sub[j] <- TRUE
	}
}
points(S, col=COL[1+sub], pch=20)
text(0.5, 1, 'all cars', pos=3)
lines((x-0.5)*2*sqrt(0.07)+0.55,(y-.5)*2*sqrt(0.07)+0.68, col='#888888')
lines((x-0.5)*2*sqrt(0.028)+0.6,(y-.5)*2*sqrt(0.025)+0.62)

set.seed(7)
N <- sample((1:j)[sub])
lines((x-0.5)/2+1.5, (y-.5)/2+.5, pch=20)

SS <- (S[N,]-0.5)/2 + 0.5
points(SS[c(1,3,4),1]+1, SS[c(1,3,4),2], col=COL[3], pch=20, cex=1.5)
text(1.5, 0.75, 'sample', pos=3)

for(i in c(1,3,4)){
	arrows(S[N[i],1], S[N[i],2], SS[i,1]+1-0.03, SS[i,2], length=0.08, col=COL[4])
}
text(0.6, 0.5+0.12-sqrt(0.025), 'cool looking\nhigh mileage cars', pos=1)

