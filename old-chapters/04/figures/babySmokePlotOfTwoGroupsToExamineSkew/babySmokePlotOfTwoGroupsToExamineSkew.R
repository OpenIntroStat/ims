library(openintro)
data(COL)

#===> take sample <===#
d <- read.delim('150Births.txt')



pdf('babySmokePlotOfTwoGroupsToExamineSkew.pdf', 4.5, 4.5)
par(mfrow=2:1, mar=c(4, 1, 0.5, 1), las=1, mgp=c(2.2, 0.7, 0))
histPlot(d$weight[d$smoke == 'smoker'], xlim=c(0, 11), axes=FALSE, xlab='Newborn weights (lbs) from mothers who smoked', col=COL[1])
axis(1)
#axis(2, at=c(0, 5, 10, 15))
histPlot(d$weight[d$smoke == 'nonsmoker'], xlim=c(0, 11), axes=FALSE, xlab='Newborn weights (lbs) from mothers who did not smoke', col=COL[1])
axis(1)
#axis(2, at=c(0, 10, 20, 30))
dev.off()
