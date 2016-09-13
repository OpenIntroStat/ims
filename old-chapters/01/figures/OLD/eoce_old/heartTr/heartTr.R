setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/heartTr")

library(openintro)
data(heartTr)

# Box plot

pdf("heartTr_SurvTimeTrBox.pdf", 5.5, 4.3)
par(mar=c(2,4.5,1,1), las=1, mgp=c(3,0.7,0))

boxPlot(heartTr$survtime, fact = heartTr$transplant, ylab = "Survival Time (days)", cex.lab = 1.75, cex.axis = 1.5)

dev.off()

# Mosaicplot

pdf("heartTr_SurvTrMosaic.pdf", 5.5, 4.3)
par(mar=c(2,2,1.1,0.5), las=1, mgp=c(4,0.8,0))

mosaicplot(transplant ~ survived, data = heartTr, main = "", cex.axis = 1.25, xlab = "", ylab = "", color = "#22558833")

mtext("survived", cex = 1.25, side = 2, adj = 0.5, las = 3, line = 0.5)
mtext("transplant", cex = 1.25, side = 1, adj = 0.5, las = 1, line = 0.5)

dev.off()

# Randomize

gr <- c(rep("c", 34), rep("t",69))
out <- c(rep(c("a", "d"), c(4, 30)), rep(c("a", "d"), c(24,45)))

source("http://stat.duke.edu/courses/Spring12/sta101.1/labs/inference.R")

set.seed(95632)
diffs = inference(out, gr, outcome = "d", order = c("t","c"), est = "proportion", type = "ht", method = "simulation", nsim = 100, null = 0, alternative = "twosided", simdist = TRUE)


pdf("heartTr_RandHist.pdf", height = 4, width = 6)

par(mar=c(3.6,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

values  <- table(diffs)
plot(diffs, type="n", xlim=c(-0.25,0.25), xlab = "simulated differences in proportions", ylab = "", axes = FALSE, ylim=c(0,max(values)))
axis(1, at = seq(-0.25,0.25,0.05), labels = c(-0.25,NA,-0.15,NA,-0.05,NA,0.05,NA,0.15,NA,0.25))
for(i in 1:length(diffs)){
	x   <- diffs[i]
	rec <- sum(diffs == x)
	points(rep(x, rec), 1:rec, pch=20, cex=0.8)
}

dev.off()