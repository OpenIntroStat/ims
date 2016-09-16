library(openintro)
data(cars)

tab <- table(cars[,c('type', 'driveTrain')])[3:1,2:3]
rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("typeDriveTrainSegBarPlotOrig.pdf", 4, 3.5, mar=c(2, 2, 0.5, 0.5), mgp=c(2.2, 0.6, 0))
COL <- c("#95B2CC", "#DD8822", "#506D1C", "#5C7581")[2:1]
barplot(apply(tab, 1, sum), col=COL[1])
tabTemp <- tab[,1]
names(tabTemp) <- NULL
barplot(tabTemp, col=COL[2], add=TRUE, axes=FALSE)
abline(h=0)
legend("topright", fill=COL[1:2], legend=c("rear", "front"))
dev.off()

myPDF("typeDriveTrainSegBarPlotSta.pdf", 4, 3.5, mar=c(2, 2, 0.5, 0.5), mgp=c(2.2, 0.6, 0))
COL <- c("#95B2CC", "#DD8822", "#506D1C", "#5C7581")[2:1]
barplot(apply(tab, 1, sum)/apply(tab, 1, sum), col=COL[1])
tabTemp <- rp[,1]
names(tabTemp) <- NULL
barplot(tabTemp, col=COL[2], add=TRUE, axes=FALSE)
abline(h=0)
dev.off()

