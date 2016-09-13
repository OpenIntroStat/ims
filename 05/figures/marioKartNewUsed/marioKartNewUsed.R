library(openintro)
data(COL)
data(marioKart)
mk      <- marioKart[marioKart$totalPr < 100, ]
mk$cond <- relevel(mk$cond, "used")
cond <- as.numeric(ifelse(mk$cond == "new", 1, 0))



myPDF('marioKartNewUsed.pdf', 4.5, 4, mar=c(3,3.5,0,0.5), mgp=c(1.9,1.5,0))
dotPlot(mk$totalPr, cond, vertical=TRUE, at=0:1, key=0:1, xlab="", ylab="", axes=FALSE, col=COL[1,3], pch=19, cex=1.3)
axis(1, at=-1:2, labels=c("", "0\n(used)", "1\n(new)", ""))
par(mgp=c(1.9,0.6,0))
axis(2)
par(las=0)
mtext("Total Price", 2, line=2.5)
g <- lm(mk$totalPr ~ cond)
abline(g, lwd=1.5, col=COL[5])
rect(-10, -1000, -0.125, 1000, border = rgb(1,1,1), col = rgb(1,1,1))
rect(10, -1000, 1.125, 1000, border = rgb(1,1,1), col = rgb(1,1,1))
text(0.48, 41.8, expression(widehat(price) *" = 42.87 + 10.90     cond_new"), cex=0.8)
points(0.605, 41.5, pch=4, cex=0.9)
dev.off()
