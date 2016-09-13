library(openintro)
data(county)
data(COL)

myPDF("county_fed_spendVsPoverty.pdf", 6, 3.5, mar=c(3, 3.5, 0.5, 0.5), mgp=c(2.4, 0.5, 0))
plot(county$poverty, county$fed_spend, pch=20, cex=0.7, col=COL[1,3], ylim=c(0,31.25), xlab="", ylab="Federal Spending Per Capita", axes=FALSE)
axis(1)
axis(2, at=seq(0, 30, 10))
box()
points(county$poverty, county$fed_spend, pch=20, cex = 0.18)
#rug(county$poverty[county$fed_spend > 40], side=3)
mtext("Poverty Rate (Percent)", 1, 1.9)
t1 <- county$poverty[1088]
t2 <- county$fed_spend[1088]
lines(c(t1,t1), c(-10,t2), lty=2, col=COL[4])
lines(c(-10,t1), c(t2,t2), lty=2, col=COL[4])
points(t1, t2, col=COL[4])
text(43, 29, "32 counties with higher\nfederal spending are not shown", cex=0.8)
dev.off()

county[1088,]
