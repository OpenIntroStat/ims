library(openintro)
data(COL)

gr <- c(rep("rosig", 67593), rep("piog",159978))
out <- c(rep(c("y", "n"), c(2593, 67593-2593)), rep(c("y", "n"), c(5386,159978-5386)))

set.seed(13)
# N <- 10^4
N <- 10  # saved result uses 10,000 runs
rosigY <- rep(NA, N)
pb <- txtProgressBar(0, N, style=3)
for(i in 1:N){
	grf  <- sample(gr)
	rosigY[i]   <- sum(out[grf == "rosig"] == "y")
	setTxtProgressBar(pb, i)
}

# save.image("results.rda")
load("results.rda")

pdf("avandia_RandHist.pdf", 6, 4)
par(mar=c(4.2,3,1,1), las=1, mgp=c(3.2,0.9,0), mfrow = c(1,1), cex.lab = 1.2, cex.axis = 1.2)

histPlot(rosigY, main="", breaks=25, xlab="Simulated rosiglitazone cardiovascular events \nunder the null hypothesis", ylab="", col = COL[7], axes = FALSE)
axis(1, at = seq(2250,2550,100))
axis(2, at=(0:4)*N/40, labels=c(0, NA, 2, NA, 4)/40)
abline(h = 0)

dev.off()