setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/salary")

set.seed(956)

salSymm = rnorm(40, mean = 65000, sd = 2000)
salSkew = c(salSymm, 225000, 250000)

options(scipen=2)

# plot

pdf("salary.pdf", 5.5, 4.3)
par(mar=c(3.6,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(2,1), cex.lab = 1.5, cex.axis = 1.25)

histPlot(salSymm, xlim = c(60000, 70000), xlab = "(1)", ylim = c(0,12), fadeColor('#225588', '55'), border = '#225588', axes = FALSE, ylab = "")
axis(1, at = seq(60000, 70000, 2500))
axis(2, at = seq(0,12,4))

histPlot(salSkew, xlab = "(2)", ylim = c(0,12), breaks = seq(0, 260000, by = 1000), fadeColor('#225588', '55'), border = '#225588', axes = FALSE, xlim = c(60000,260000), ylab = "")
axis(1, at = seq(60000, 260000, 50000))
axis(2, at = seq(0,12,4))

dev.off()

# summary statistics

library(xtable)

summaryTable = as.data.frame(cbind(summary(salSymm), summary(salSkew)))
names(summaryTable) = c("(1)","(2)")
summaryTable = rbind(c(length(salSymm), length(salSkew)), summaryTable, c(sd(salSymm), sd(salSkew)))
rownames(summaryTable)[1] = "n"
rownames(summaryTable)[dim(summaryTable)[1]] = "SD"

xtable(summaryTable, digits = 0)