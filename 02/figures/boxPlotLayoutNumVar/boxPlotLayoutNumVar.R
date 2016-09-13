require(openintro)
data(email50)
data(COL)
d   <- email50$num_char

myPDF("boxPlotLayoutNumVar.pdf", 5.5, 4, mar=c(0,4,0,1), mgp=c(2.8, 0.7, 0), las=1)
boxPlot(d, ylab='Number of Characters (in thousands)', xlim=c(0.3,3), axes=FALSE, ylim=range(d)+sd(d)*c(-1,1)*0.2)
axis(2)

arrows(2,0, 1.35,min(d)-0.5, length=0.08)
text(2,0,'lower whisker', pos=4)

arrows(2, quantile(d, 0.25)+sd(d)/7, 1.35, quantile(d, 0.25), length=0.08)
text(2, quantile(d, 0.25)+sd(d)/6.5, expression(Q[1]~~'(first quartile)'), pos=4)

m <- median(d)
arrows(2, m+sd(d)/5, 1.35, m, length=0.08)
text(2,m+sd(d)/4.7,'median', pos=4)

q <- quantile(d, 0.75)
arrows(2, q+sd(d)/4, 1.35, q, length=0.08)
text(2,q+sd(d)/3.8,expression(Q[3]~~'(third quartile)'), pos=4)

arrows(2, rev(sort(d))[4]-sd(d)/7, 1.35, rev(sort(d))[4], length=0.08)
text(2, rev(sort(d))[4]-sd(d)/6.8,'upper whisker', pos=4)

y <- quantile(d, 0.75) + 1.5*IQR(d)
arrows(2, y-0.1*sd(d), 1.35, y, length=0.08)
lines(c(0.72,1.28), rep(y,2), lty=3, col='#00000066')
text(2,y-0.1*sd(d),'max whisker reach', pos=4)

m <- rev(tail(sort(d), 5))
s <- m[1]-0.3*sd(m)
arrows(2, s, 1.1, m[1]-0.2, length=0.08)
arrows(2, s, 1.1, m[2]+0.3, length=0.08)
arrows(2, s, 1.1, m[3]+0.35, length=0.08)
text(2,s,'suspected outliers', pos=4)

points(rep(0.4, 25), rev(sort(d))[1:25], cex=rep(1.3, 25), col=rep(COL[1,3], 25), pch=rep(1, 25))
points(rep(0.4, 25), sort(d)[1:25], cex=rep(1, 25), col=rep(COL[4,3], 25), pch=rep("-", 25))

dev.off()

sort(d)[25:26]
quantile(d, c(0.25, 0.5, 0.75))
tail(sort(d), 4)


myPDF("boxPlotNumVarSmall.pdf", 1.5, 2.5, mar=c(0,4.1,0,0), mgp=c(2.3, 0.45, 0), las=1, tcl=-0.2)
boxPlot(d, ylab='', axes=FALSE, ylim=range(d)+sd(d)*c(-1,1)*0.2, xlim=c(0.5, 1.45))
axis(2, cex=1.1)
par(las=0)
mtext("Number of Characters\n(in thousands)", 2, line=2, cex=1.1)
dev.off()
