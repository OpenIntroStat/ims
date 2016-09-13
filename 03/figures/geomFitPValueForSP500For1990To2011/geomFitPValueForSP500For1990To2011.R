library(openintro)
data(COL)
library(stockPortfolio)
gr <- getReturns("^GSPC", "d", start="1990-01-01", end="2011-12-31")
R  <- ifelse(gr$R[gr$R != 0] > 0, 1, 0)
CC <- table(diff(which(R == 1)))
CC[names(CC) == 7]     <- sum(CC[names(CC) %in% 7:9])
CC <- CC[- which(names(CC) %in% 8:9)]
p  <- mean(R)
pr <- p*(1-p)^(0:5)
pr <- append(pr, 1-sum(pr))

#CC <- c(1298, 685, 367, 157, 77, 33, 20)
CC <- c(CC)
C  <- rep(1:7, CC)
#EE <- c(1368, 644, 304, 143, 67, 32, 28)
EE <- round(pr*sum(CC))
E  <- rep(1:7, EE)

X2 <- sum((CC - EE)^2/EE)

myPDF('geomFitPValueForSP500For1990To2011.pdf', 6*1.1, 2.17*1.1, mar=c(2, 1, 1, 1), mgp=c(2.1, 0.5, 0))
x <- seq(0, 35, 0.05)
y <- dchisq(x, 6) #*1:length(x)
plot(x, y, type='l', axes=FALSE, xlim=c(0, 30))
abline(h=0)
axis(1)

these <- which(x > 15.08)
X <- x[c(these[1], these, rev(these)[1])]
Y <- c(0, y[these], 0)
polygon(X, Y, col=COL[1])
lines(c(15.1, 500), c(0, 0), lwd=2)
arrows(15.1, max(y)/3, 15.5, max(y)/10, length=0.1, col=COL[1])
text(15.1, max(y)/3, 'Area representing\nthe p-value', pos=3, col=COL[1])

dev.off()