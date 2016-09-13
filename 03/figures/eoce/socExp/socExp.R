library(openintro)
data(COL)
set.seed(3)

sc <- c(rep("p", 20), rep("c",25))
int <- c(rep(c("y", "n"), c(5, 15)), rep(c("y", "n"), c(15, 10)))

N <- 10^4
d <- rep(NA, N)
for(i in 1:N){
	scf  <- sample(sc)
	p1   <- sum(int[scf == "p"] == "y") / 20
	p2   <- sum(int[scf == "c"] == "y") / 25
	d[i] <- p1 - p2
}
sum((d) <= -0.35) / N

myPDF("socExp.pdf", 6.7, 3.5, mar=c(4,2,0,0), las=1, mgp=c(2.8,0.55,0), mfrow = c(1,1))

#histPlot(d, breaks = 24)
temp1 <- sort(unique(d))
temp2 <- diff(temp1[1:2])/2
br    <- seq(temp1[1]-temp2/2, tail(temp1,1)+temp2/2, temp2)
#br   <- (temp - diff(temp[1:2])/2)
#br   <- c(br, max(br) + diff(temp[1:2]))

histPlot(d, breaks=br, col=COL[7], main="", xlab=expression(hat(p)[pr_sim] - hat(p)[con_sim]*"    "), ylab="", axes=FALSE)
axis(1, seq(-0.4, 0.4, 0.2))
axis(2, at=(0:4)*N/20, labels=c(0, NA, 2, NA, 4)/20)
abline(h = 0)

abline(h = c((1:4)*N/20), lty = 3, lwd = 2, col = "gray")

dev.off()

#

pdf("socExpSoln.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.8,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

histPlot(d, breaks=br, col=COL[7], main="", xlab=expression(hat(p)[pr_sim] - hat(p)[con_sim]*"    "), ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:4)*N/20, labels=c(0, NA, 2, NA, 4)/20)
histPlot(d[d <= -0.35], breaks=br, col=COL[1], add=TRUE)
abline(h=0)
lines(rep(-0.35, 2), c(0, 3)*N/25, lty=3, lwd=1.7)
text(-0.35, 3*N/25, "-0.35", pos=3, cex=1.25)

dev.off()


