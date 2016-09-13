setwd("~/Desktop/Teaching/Sta 101 - S12/Exams/Final/figures/eoce/sinusitis")

tr = c(rep("anti",85), rep("pl",81))
imp = c(rep("yes",66), rep("no",19), rep("yes",65), rep("no",16))

source("http://stat.duke.edu/courses/Spring12/sta101.1/labs/inference.R")

set.seed(284)
diffs = inference(imp, tr, outcome = "yes", order = c("anti","pl"), est = "proportion", type = "ht", method = "simulation", nsim = 100, null = 0, alternative = "twosided", simdist = TRUE)


pdf("sinusitis_rand.pdf", 7, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

values  <- table(diffs)
plot(diffs, type="n", xlim=c(-0.20,0.20), xlab = "simulated differences in proportions", ylab = "", axes = FALSE, ylim=c(0,max(values)))
axis(1, at = seq(-0.2,0.2,0.02), labels = c(-0.2,rep(NA,4),-0.1,rep(NA,4),0,rep(NA,4),0.1,rep(NA,4),0.2))
for(i in 1:length(diffs)){
	x   <- diffs[i]
	rec <- sum(diffs == x)
	points(rep(x, rec), 1:rec, pch=20, cex=0.8)
}

dev.off()
