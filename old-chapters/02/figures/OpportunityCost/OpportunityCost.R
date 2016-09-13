library(openintro)
source("helper.R")
data(COL)

set.seed(2)

group   <- c(rep('control', 75), rep('treatment', 75))
outcome <- c(rep(c('buy DVD', 'do not buy DVD'), c(56, 19)),
             rep(c('buy DVD', 'do not buy DVD'), c(41, 34)))

nsim  = 1000
n     = length(group)
group = group
var1  = outcome
success = "do not buy DVD"
sim   = matrix(NA, nrow = n, ncol = nsim)
n1    = n2 = 75

Statistic <- function(var1, group){	
  t1 <- var1 == success & group == levels(as.factor(group))[1]
  t2 <- var1 == success & group == levels(as.factor(group))[2]
  sum(t1)/n1 - sum(t2)/n2 
}

for(i in 1:nsim){
  sim[,i] = sample(group, n, replace = FALSE)
}

sim_dist = apply(sim, 2, Statistic, var1 = outcome)
diffs    = sim_dist
pval     = sum(diffs >= 0.29) / nsim
values  <- table(sim_dist)

xlab <- paste0("Simulated difference in proportions ",
               "of students who do not buy the DVD")
myPDF('OpportunityCostDiffsDotPlot.pdf', 7, 4.25,
      mar=c(4.7, 4.5, 0.5, 0.5), mgp=c(3.35,0.6,0))
DotPlotRegularized(diffs, xlab = xlab, ylab = "", cex = 2)
text(0.2, 5, "observed\ndifference", pos = 3)
lines(rep(0.2, 2), c(0, 5), lty = 2, col = COL[6])
dev.off()




X <- c()
Y <- c()
udiffs <- sort(unique(diffs))
for(i in 1:length(udiffs)){
  x   <- udiffs[i]
  rec <- sum(sim_dist == x)
  X   <- append(X, rep(x, rec))
  Y   <- append(Y, 1:rec)
}

bin.width <- diff(udiffs)[1]
breaks <- c(udiffs - bin.width / 4, udiffs + bin.width / 4)
myPDF('OpportunityCostDiffsRightTail.pdf', 7, 3.25,
      mar=c(3.7, 4.5, 0.5, 0.5), mgp=c(3.35,0.6,0))
histPlot(diffs, breaks = breaks, axes = FALSE, col = rgb(1,1,1),
         xlab = "", ylab = "Proportion of simulated scenarios                ")
diffs.tmp <- diffs[diffs > 0.19]
histPlot(diffs.tmp, breaks = breaks, col = COL[1], add = TRUE)
axis(1)
axis(2, at = seq(0, 100, 50), labels = format(seq(0, 50, 25) / nsim))
lines(c(0.2, 0.2), c(0, 30), lty = 3, lwd = 3)
text(0.2, 30, "observed\ndifference", pos = 3)
par(las = 0)
mtext(xlab, 1, 2.5)
dev.off()

mean(diffs >= 0.197)


