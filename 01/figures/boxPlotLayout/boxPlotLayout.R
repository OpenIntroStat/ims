# load in the Boxplot function from helperCode
require(openintro)
data(cars)

COL <- c('#22558838', '#664411EE')

pdf("boxPlotLayout.pdf", 6, 4)
par(mar=c(0,4,0,1), mgp=c(2.8, 0.7, 0), las=1)
boxPlot(cars$price, ylab='price ($1000s)', xlim=c(0.3,3), axes=FALSE, ylim=c(0,65))
axis(2)

arrows(2,0, 1.33,min(cars$price)-0.5, length=0.08)
text(2,0,'lower whisker', pos=4)

arrows(2, 8, 1.33, quantile(cars$price, 0.25), length=0.08)
text(2,8,expression(Q[1]~~'(first quartile)'), pos=4)

m <- median(cars$price)
arrows(2, m, 1.33, m, length=0.08)
text(2,m,'median', pos=4)

q <- quantile(cars$price, 0.75)
arrows(2, q, 1.33, q, length=0.08)
text(2,q,expression(Q[3]~~'(third quartile)'), pos=4)

arrows(2, 46, 1.33, rev(sort(cars$price))[2], length=0.08)
text(2,46,'upper whisker', pos=4)

arrows(2, 52, 1.33, 49.5, length=0.08)
lines(c(0.72,1.28), rep(49.5,2), lty=3, col='#00000066')
text(2,52,'max whisker reach', pos=4)

m <- max(cars$price)
arrows(2, m-2, 1.33, m-0.5, length=0.08)
text(2,m-2,'suspected outlier', pos=4)

points(rep(0.4, 27), rev(sort(cars$price))[1:27], cex=rep(1.5, 27), col=rep(COL[1], 27), pch=rep(20, 27))
points(rep(0.4, 27), sort(cars$price)[1:27], cex=rep(1, 27), col=rep(COL[2], 27), pch=rep(1, 27))






dev.off()
