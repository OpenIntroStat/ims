library(openintro)
data(cars)
data(COL)

myPDF("carsPriceVsWeight.pdf", 5, 3.3, mar=c(3.6,3.6,1,1), mgp=c(2.5,0.7,0))

plot(cars$weight, cars$price, xlab='Weight (Pounds)', ylab='Price ($1000s)', pch=19, col=COL[1,2], ylim=c(0, max(cars$price)))

w  <- seq(1000, 5000, 100)
# Rough Model
g1 <- lm(price ~ weight, cars, weights=1/weight^2)
g2 <- lm(price ~ weight + I(weight^2), cars, weights=1/weight^2)
p  <- predict(g2, data.frame(weight=w))
lines(w, p, lty=2, col=COL[5,3])

dev.off()

#anova(g1, g2)
#hist(cooks.distance(g2))
