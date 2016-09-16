library(openintro)
data(countyComplete)
data(county)
cc  <- countyComplete
COL <- c('#55000044','#556699')

myPDF("countyIncomeDotPlot.pdf", 7.5, 1.25, mar=c(3.6,1,0,1), las=1, mgp=c(2.5,0.7,0))
set.seed(3)
d <- county$income[sample(nrow(county), 25)]
dotPlot(d, xlab='Per Capita Income (US Dollars)', ylab='', pch=20, col=COL[1], cex=1.5, xlim=range(county$income), ylim=c(0.95,1.05))
M <- mean(d)
polygon(M + c(-2,2,0)*1000, c(0.95, 0.95, 0.98), border=COL[2], col=COL[2])

dev.off()


