
require(Cairo)
CairoPDF("sdAsRuleForCarsPrice.pdf", 6, 1.5)


par(mar=c(3.5,0,0,0), mgp=c(2.2,0.7,0))
dotPlot(cars$price, col='#22558888', pch=20, cex=2, xlim=c(0,70), axes=FALSE, xlab=expression(paste("price data, ", bar(x)," = 20, ", s[x], " = 11.5")), type='n')
m <- mean(cars$price)
s <- sd(cars$price)
abline(v=m, col='#00000033')
rect(m-s, -5, m+s, 5, col='#00000025', border='#00000000')
rect(m+s, -5, m+2*s, 5, col='#00000015', border='#00000000')
rect(m-s, -5, m-2*s, 5, col='#00000015', border='#00000000')
rect(m+2*s, -5, m+3*s, 5, col='#0000000B', border='#00000000')
rect(m+4*s, -5, m+3*s, 5, col='#00000008', border='#00000000')
dotPlot(cars$price, col='#22558888', pch=20, cex=2, add=TRUE, axes=FALSE)
axis(1, at=m+s*c(-3:7), labels=round(m + s*(-3:7), 1))


dev.off()
