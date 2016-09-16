setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/histBoxMatch")

oiB = "#3E9BC0"

set.seed(7365)

sym = rnorm(1000, mean = 60, sd = 3)
uni = runif(1000, min = 0, max = 100)
rs = rgamma(1000, shape = 3, rate = 2)


pdf("histBoxMatch.pdf", width = 12, height = 3.5)

par(mar=c(4,3.6,0,0), las=1, mgp=c(2.7,0.7,0), mfrow = c(1,6), cex.lab = 1.75, cex.axis = 1.5)

histPlot(sym, xlab = "(a)", ylab = "", col = oiB, axes = FALSE)
axis(1, seq(50,70,10))

histPlot(uni, xlab = "(b)", ylab = "", col = oiB, axes = FALSE)
axis(1, seq(0,100,50))

histPlot(rs, xlab = "(c)", ylab = "", col = oiB, axes = FALSE)
axis(1, seq(0,6,2))

boxPlot(rs, xlab = "(1)", ylab = "", col = fadeColor(oiB, 66))
boxPlot(sym, xlab = "(2)", ylab = "", col = fadeColor(oiB, 66))
boxPlot(uni, xlab = "(3)", ylab = "", col = fadeColor(oiB, 66))

dev.off()