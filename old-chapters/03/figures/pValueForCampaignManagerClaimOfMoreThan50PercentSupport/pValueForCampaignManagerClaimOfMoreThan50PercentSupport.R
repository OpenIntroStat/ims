require(openintro)
data(COL)

myPDF('pValueForCampaignManagerClaimOfMoreThan50PercentSupport.pdf',
      1.5 * 4, 1.5 * 1.7, mar=c(1.7,0,0.1,0), mgp=c(3,0.5,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=FALSE, xlim=c(-3.4,3.4))
axis(1, at=c(-5, 0, 0.89, 5), label=expression(0, 0.50, 0.52, 0), cex.axis=0.9)
these <- which(X >= 0.89)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1], border=COL[5])
these <- which(X <= -0.89)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1], border=COL[5])

lines(X, Y)
abline(h=0)


dev.off()