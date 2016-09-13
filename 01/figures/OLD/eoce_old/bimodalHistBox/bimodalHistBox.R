setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/bimodalHistBox")

set.seed(12345)

bimod = c(rnorm(300, mean = 5, sd = 1), rnorm(300, mean = 12, sd = 1), runif(25, min = 13, max = 28))

pdf("bimodalHistBox.pdf", height = 3, width = 9)
par(mar=c(3.6,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,2), cex.lab = 1.75)

histPlot(bimod, xlab = "", ylab = "", yaxt = "n", fadeColor('#225588', '55'), border = '#225588')
boxPlot(bimod)

dev.off()