require(openintro)

d <- read.delim('satGPA.txt')

plot(d$SATM, d$FYGPA, col=fadeColor(d$sex, '88'), pch=c(1,20)[d$sex], cex=c(1,1.5)[d$sex])
g <- lm(d$FYGPA ~ I(d$SATM))
summary(g)

loss <- function(a, b, d){
	p <- a + b*d$SATM
	sum(abs(d$FYGPA-p))
}
a <- seq(0.372, 0.375, 0.00005)
b <- seq(0.0385, 0.0387, 0.000005)
mins <- c(a[1], b[1])
theMin <- loss(a[1], b[1], d)
for(i in 1:length(a)){
	for(j in 1:length(b)){
		hold <- loss(a[i], b[j], d)
		if(hold < theMin){
			mins <- c(a[i],b[j])
			theMin <- hold
		}
	}
}

pdf('satGPAAllTwoLinesFitted.pdf', 5, 3.3)
par(mar=c(3, 3, 1, 1), mgp=c(1.8, 0.6, 0), las=1)
plot(d$SATM, d$FYGPA, #, col=fadeColor(d$sex, '88'), pch=c(1,20)[d$sex], cex=c(1,1.5)[d$sex],
col='#22558863', pch=20, cex=1,
xlab='SAT Math (percentile)', ylab='First Year GPA')
abline(mins[1], mins[2], lty=2, lwd=2)
abline(g, lwd=2)
dev.off()


