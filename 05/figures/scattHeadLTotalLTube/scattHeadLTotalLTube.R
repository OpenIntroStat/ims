library(openintro)
data(COL)
data(possum)
data(cars)
myPDF('scattHeadLTotalLTube.pdf', 8/1.1, 3.8/1.1, mar=c(3.2,3.8,1,1), mgp=c(2.4,0.7,0), las=1, mfrow=1:2)

plot(possum$totalL, possum$headL, pch=20, col=COL[1,2], cex=1.7, xlab='', ylab='Head length (mm)', type="n")
mtext("Total length (cm)", 1, line=2.1)

g <- lm(headL ~ totalL, possum)
x <- c(0, 200, 200, 0, 0)
y <- 42.71 + c(-5, 0.5729*200-5, 0.5729*200+5, 5, -5)
polygon(x, y, col=COL[7], border='#00000000')
points(possum$totalL, possum$headL, pch=20, col=COL[1,2], cex=1.7)


plot(cars$weight, cars$mpgCity, pch=20, col=COL[1,2], cex=1.7, ylab='Miles per gallon (city driving)', xlab='', type="n")
mtext("Weight (pounds)", 1, line=2.1)

g <- lm(mpgCity ~ weight + I(weight^2), cars)
x <- c(seq(1000, 5000, 100), rev(seq(1000, 5000, 100)), 1000)
y <- 87.11 - 0.03508*x + 0.000004432*x^2 +
	5*c(rep(-1, 41), rep(1, 41), -1)
polygon(x, y, col=COL[7], border='#00000000')
points(cars$weight, cars$mpgCity, pch=20, col=COL[1,2], cex=1.7)


dev.off()
