
par(mar=c(3.6, 3.6, 1, 1), mgp=c(2.4, 0.7, 0), las=1)
boxPlot(cars$price, cars$type, xlab='type', ylab='price')
#boxplot(cars$price ~ cars$type)
