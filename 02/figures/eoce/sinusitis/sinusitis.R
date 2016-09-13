library(openintro)
data(COL)

gr <- c(rep("antibiotic", 85), rep("placebo",81))
out <- c(rep(c("improved", "not"), c(66, 19)),
         rep(c("improved", "not"), c(65, 16)))

set.seed(13)
# N <- 10^4
N <- 10
antibioticY <- rep(NA, N)
pb <- txtProgressBar(0, N, style=3)
for(i in 1:N){
	grf  <- sample(gr)
	antibioticY[i] <- sum(out[grf == "antibiotic"] == "improved")
	setTxtProgressBar(pb, i)
}

# save.image("results.rda")
load("results.rda")

pdf("sinusitis.pdf", 6, 4)
par(mar=c(5.3,3,1,1), las=1, mgp=c(4.2,0.9,0), mfrow = c(1,1), cex.lab = 1.2, cex.axis = 1.2)

histPlot(antibioticY, breaks = seq(40.25, 100.25, 0.5), main="",
         xlab=paste0("Simulated number of antibiotic patients\n",
                     "who self-reported an improvement\n",
                     "under the null hypothesis"),
         ylab="", col = COL[7], axes = FALSE,
         xlim = range(antibioticY))
axis(1)
axis(2, at=(0:4)*N/40, labels=c(0, NA, 2, NA, 4)/40)
abline(h = 0)

dev.off()