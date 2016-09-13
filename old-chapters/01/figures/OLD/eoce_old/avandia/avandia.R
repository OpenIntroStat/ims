setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/avandia")

library(openintro)

gr <- c(rep("rosig", 67593), rep("piog",159978))
out <- c(rep(c("y", "n"), c(2593, 67593-2593)), rep(c("y", "n"), c(5386,159978-5386)))

set.seed(13)
N <- 10^2
rosigY <- rep(NA, N)
for(i in 1:N){
	grf  <- sample(gr)
	rosigY[i]   <- sum(out[grf == "rosig"] == "y")
}

pdf("avandia_RandHist.pdf", 6, 4)
par(mar=c(4.2,2.5,1,1), las=1, mgp=c(3.2,0.9,0), mfrow = c(1,1), cex.lab = 1.2, cex.axis = 1.2)

histPlot(rosigY, main="", xlab="Simulated rosiglitazone cardiovascular events \nunder independence model", ylab="", border = '#225588', col = fadeColor('#225588', '55'), axes = FALSE)
axis(1, at = seq(2250,2550,100))
axis(2, at=(0:4)*N/20, labels=c(0, NA, 2, NA, 4)/20)
abline(h = 0)

dev.off()