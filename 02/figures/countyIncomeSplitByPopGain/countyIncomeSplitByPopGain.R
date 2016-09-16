library(openintro)
data(countyComplete)
data(COL)

cc  <- countyComplete
pop <- sign(cc$pop2010 - cc$pop2000 - 0.5)
pov <- cc$median_household_income / 1000

set.seed(1)
these <- sample(sum(pop == -1, na.rm=TRUE), 50)
sampL <- round(pov[pop == -1][these], 1)
these <- sample(sum(pop == 1, na.rm=TRUE), 100)
sampG <- round(pov[pop == 1][these], 1)
M  <- matrix(c(sampG, rep("", 2), sampL, rep("", 1)), 17)
DB <- 6
for(i in 1:nrow(M)){
  for(j in 1:ncol(M)){
    cat(M[i,j])
    if(j == DB)
      cat(" && ")
    else if(j == ncol(M))
      cat(" \\\\")
    else
      cat(" & ")
  }
  cat("\n")
}
pop[pop == 1] <- "gain"
pop[pop == -1] <- "no gain"




#gain <- density(pov[pop == "gain"])
#no gain <- density(pov[pop == "no gain"])

#yR <- c(0, max(c(gain$y, no gain$y)))
#xR <- range(c(gain$x, no gain$x))
xR  <- range(pov)

myPDF("countyIncomeSplitByPopGain.pdf", 7.5, 4, mar=c(3.6, 3.6, 1, 0.5), mgp=c(2.4, 0.7, 0), las=1, mfrow=1:2)
boxPlot(pov, pop, xlab='Change in Population', ylab='Median Income ($1000s)', lcol="#00000000", col="#00000000")
boxPlot(pov[pop == "gain"], lcol=COL[1], col=COL[1,3], add=1)
boxPlot(pov[pop == "no gain"], lcol=COL[4], col=COL[4,3], add=2)

par(mar=c(3.6, 0.5, 1, 1), las=1)

histPlot(pov[pop == 'no gain'], breaks=50, col='#ffffff00', border=COL[4], probability=TRUE, xlab='Median Income ($1000s)', ylab='', hollow=TRUE, axes=FALSE, lty=3, lwd=4, xlim=xR)
histPlot(pov[pop == 'no gain'], breaks=50, col='#ffffff00', border=COL[4], probability=TRUE, add=TRUE, hollow=TRUE, lty=3, lwd=2)
histPlot(pov[pop == 'no gain'], breaks=50, col='#ffffff00', border=COL[4], probability=TRUE, add=TRUE, hollow=TRUE, lty=3, lwd=1)
histPlot(pov[pop == 'gain'], breaks=50, col='#ffffff00', border=COL[1], probability=TRUE, add=TRUE, hollow=TRUE, lty=1, lwd=2)
axis(1)
legend('topright', col=COL[c(1,4)], lty=c(1,3), lwd=c(2,2.8), legend=c('gain', 'no gain'))
legend('topright', col=c(rgb(0,0,0,0), COL[4]), lty=c(1, 3), lwd=c(2,1.4), legend=c('gain', 'no gain'), bg=rgb(0,0,0,0), box.col=rgb(0,0,0,0), text.col=rgb(0,0,0,0))
legend('topright', col=c(rgb(0,0,0,0), COL[4]), lty=c(1, 3), lwd=c(2,0.7), legend=c('gain', 'no gain'), bg=rgb(0,0,0,0), box.col=rgb(0,0,0,0), text.col=rgb(0,0,0,0))
dev.off()

