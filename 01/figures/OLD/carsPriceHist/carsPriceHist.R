library(openintro)
data(cars)

H <- hist(cars$price, breaks=12, plot=FALSE)
counts <- rbind(H$counts)
colnames(counts) <- paste(H$breaks[1:12], 'to', H$breaks[2:13])
require(xtable)
xtable(counts)

myPDF("carsPriceHist.pdf", 1.1*5.5, 3.3, mar=c(3.5,3.5,0.15,1), mgp=c(2.4,0.7,0))
histPlot(cars$price, breaks=12, xlim=c(0,70), xlab='price ($1000s)', ylim=c(0, 11), col="#22558833", border="#225588")
dev.off()