library(openintro)
data(countyComplete)
data(county)
cc  <- countyComplete
COL <- c('#550000AA','#339966')

myPDF("countyIncomePPH.pdf", 6, 3.5, mar=c(3, 3.5, 0.5, 0.5), mgp=c(2.4, 0.5, 0))
plot(county$income, county$pph, pch=20, cex=0.7, col=COL[2], xlab="", ylab="Average Persons Per Household", axes=FALSE)
axis(1)
axis(2)
box()
points(county$income, county$pph, pch=".", cex=1)
#rug(county$poverty[county$fed_spend > 40], side=3)
mtext("Income Per Capita (US Dollars)", 1, 1.9)
dev.off()

#_____ Email Investigation ______#
data(spam)
#spam[1,]
#plot(spam$lines, spam$num_char, xlim=c(0, 2000), ylim=c(0, 1e5))
