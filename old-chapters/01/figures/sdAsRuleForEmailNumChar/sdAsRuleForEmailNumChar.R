library(openintro)
data(email50)
data(COL)
d <- email50$num_char
mean(d)
sd(d)

myPDF("sdAsRuleForEmailNumChar.pdf", 6, 1.5, mar=c(3.5,0,0,0), mgp=c(2.2,0.7,0))
dotPlot(d, col=COL[1,2], pch=20, cex=2, xlim=range(d)+sd(d)/2*c(-1,1), axes=FALSE, xlab=expression(paste("Number of Characters (in thousands), ", bar(x)," = 11,600, ", s[x], " = 13,130")), type='n')
m <- round(mean(d), 1)
s <- round(sd(d), 1)
abline(v=m, col=COL[7])
rect(m-s, -5, m+s, 5, col='#0000001C', border='#00000000')
rect(m+s, -5, m+2*s, 5, col='#00000012', border='#00000000')
rect(m-s, -5, m-2*s, 5, col='#00000012', border='#00000000')
rect(m+2*s, -5, m+3*s, 5, col='#0000000A', border='#00000000')
rect(m+4*s, -5, m+3*s, 5, col='#00000006', border='#00000000')
dotPlot(d, col=COL[1,2], pch=20, cex=2, add=TRUE, axes=FALSE)
dotPlot(d, col=1, pch=20, cex=0.3, add=TRUE, axes=FALSE)
axis(1, at=m+s*c(-3:7), labels=format(m + s*(-3:7)))


dev.off()

sum(d > m-s & d < m+s)/length(d)
sum(d > m-2*s & d < m+2*s)/length(d)
