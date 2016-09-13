library(openintro)
source("helper.R")
data(COL)

set.seed(2)

group   <- c(rep('control', 75), rep('treatment', 75))
outcome <- c(rep(c('buy DVD', 'do not buy DVD'), c(56, 19)),
             rep(c('buy DVD', 'do not buy DVD'), c(41, 34)))

nsim  = 10000
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
diffs.tmp <- diffs[diffs > 0.19]

mean(diffs >= 0.197)


myPDF('OpportunityCostDiffs_w_normal.pdf', 6.5, 3.25,
      mar=c(3.7, 1.5, 0.5, 0.5), mgp=c(3.35,0.6,0))
histPlot(diffs, breaks = breaks, axes = FALSE, col = COL[2],
         xlab = "", ylab = "Proportion of simulated scenarios                ")
axis(1)
x0 <- seq(-.5, .5, length.out = 1000)
y0 <- dnorm(x0, 0, 0.078)
lines(x0, 250 * y0)
lines(c(0.2, 0.2), c(0, 300), lty = 3, lwd = 3)
text(0.2, 300, "observed\ndifference", pos = 3)
par(las = 0)
mtext(paste0("Simulated difference in proportions ",
             "of students who do not buy the DVD"), 1, 2.5)
dev.off()

myPDF('OpportunityCostDiffs_normal_only.pdf',
      5*0.9, 2.3, mar = c(2, 0.5, 0.2, 0.5))
normTail(0, 0.078, -0.2, 0.2, col = COL[1])
dev.off()

pnorm(-0.197 / 0.078) * 2
