library(openintro)
data(COL)
load('d.rda')

g <- lm(d$gift_aid ~ d$family_income)
summary(g)

loss <- function(a, b, d){
	p <- a + b*d$family_income
	sum(abs(d$gift_aid - p))
}
a      <- round(g$coef[1], 2) + seq(-0.5, 0.5, 0.001)
b      <- round(g$coef[2], 3) + seq(-0.01, 0.01, 0.0001)
mins   <- c(a[1], b[1])
theMin <- loss(a[1], b[1], d)
pb     <- txtProgressBar(1, length(a), style=3)
for(i in 1:length(a)){
	for(j in 1:length(b)){
		hold <- loss(a[i], b[j], d)
		if(hold < theMin){
			mins <- c(a[i],b[j])
			theMin <- hold
		}
	}
	setTxtProgressBar(pb, i)
}



myPDF('elmhurstScatterW2Lines.pdf', 5.5, 3.3, mar=c(3.1, 3.6, 1, 1), mgp=c(2, 0.6, 0), las=1)

plot(d$family_income, d$gift_aid,
     col=COL[1,2], pch=19, cex=1,
     xlab='Family income ($1000s)',
     ylab='', axes=FALSE,
     xlim=c(0, 280), 
     ylim=c(0, 35))
axis(1, at=(0:4)*100)
axis(2, at=(0:3)*10)
box()
par(las=0)
mtext("Gift aid from university ($1000s)", 2, line=2.5)
abline(mins[1], mins[2], lty=2, lwd=2)
abline(g, lwd=2)

dev.off()


myPDF('elmhurstScatterWLSROnly.pdf', 5.5, 3.3, mar=c(3.1, 3.6, 1, 1), mgp=c(2, 0.6, 0), las=1)

plot(d$family_income, d$gift_aid,
     col=COL[1,2], pch=19, cex=1,
     xlab='Family income ($1000s)',
     ylab='', axes=FALSE,
     xlim=c(0, 280), 
     ylim=c(0, 35))
axis(1, at=(0:4)*100)
axis(2, at=(0:3)*10)
box()
par(las=0)
mtext("Gift aid from university ($1000s)", 2, line=2.5)
#abline(mins[1], mins[2], lty=2, lwd=2)
abline(g, lwd=2)

dev.off()


myPDF('elmhurstScatterLSRLine_conditions.pdf', 5.5, 3.3, mar=c(3.1, 3.6, 1, 1), mgp=c(2, 0.6, 0), las=1)

plot(d$family_income, d$gift_aid,
     col=COL[1,2], pch=19, cex=1,
     xlab='Family income ($1000s)',
     ylab='', axes=FALSE,
     xlim=c(0, 280), 
     ylim=c(0, 35))
axis(1, at=(0:4)*100)
axis(2, at=(0:3)*10)
box()
par(las=0)
mtext("Gift aid from university ($1000s)", 2, line=2.5)
abline(g, lwd=2, col = COL[5,2])
dev.off()

