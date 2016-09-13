library(openintro)
data(COL)
myPDF('FourCaseStudies.pdf', 12, 7.5,
      mar=c(2.5, 1.5, 1, 1.5), mgp=c(3.35,0.6,0),
      mfrow = c(2, 2))
number.of.simulations <- 10000
m.fact <- number.of.simulations / 1e3

# _____ Opportunity Cost _____ #
set.seed(2)
group   <- c(rep('control', 75), rep('treatment', 75))
outcome <- c(rep(c('buy DVD', 'do not buy DVD'), c(56, 19)),
             rep(c('buy DVD', 'do not buy DVD'), c(41, 34)))
nsim  = number.of.simulations
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
histPlot(diffs, breaks = breaks, axes = FALSE,
         col = COL[2,2], xlab = "", ylab = "")
axis(1)
rect(-0.135, 12 * m.fact, 0.135, 28 * m.fact,
     col = rgb(1,1,1,0.65), border = rgb(0,0,0,0))
text(0, 20 * m.fact, cex = 2, "Opportunity Cost")



# _____ CPR / Blood Thinner _____ #
set.seed(1)
tr <- rep(1:2, c(50, 40))
su <- c(rep(c("s", "d"), c(11, 39)),
        rep(c("s", "d"), c(14, 26)))
N <- number.of.simulations * 10
d <- rep(NA, N)
for(i in 1:N){
	trf  <- sample(tr)
	p1   <- sum(su[trf == 1] == "s") / 50
	p2   <- sum(su[trf == 2] == "s") / 40
	d[i] <- p2 - p1
}
sum((d) > 0.1299) / N
udiffs    <- sort(unique(d))
bin.width <- diff(udiffs)[1]
breaks    <- c(udiffs - bin.width / 4, udiffs + bin.width / 4)
histPlot(d, breaks = breaks, col = COL[2,2],
         main="", xlab="", ylab="", axes=FALSE)
axis(1)
rect(-0.07, 153 * m.fact, 0.07, 347 * m.fact,
     col = rgb(1,1,1,0.65), border = rgb(0,0,0,0))
text(0, 250 * m.fact, cex = 2,
     paste0("CPR "))



# _____ Medical Consultant _____ #
set.seed(2)
pHat <- rbinom(number.of.simulations, 62, 0.1)/62
M    <- max(pHat)*62
histPlot(pHat, breaks=(-1:(2*M)+0.75)/2/62,
         xlab="", ylab="", axes = FALSE, col = COL[2,2])
axis(1)
rect(0.023, 21 * m.fact, 0.168, 38.5 * m.fact,
     col = rgb(1,1,1,0.65), border = rgb(0,0,0,0))
text(0.1, 30 * m.fact, cex = 2,
     paste0("Medical Consultant"))


# _____ Tappers + Listeners _____ #
set.seed(6)
nsim <- number.of.simulations
n    <- 120
p    <- 0.5
X    <- matrix(sample(c(0,1), nsim * n, TRUE), nsim, n)
p.   <- apply(X, 1, sum) / n
un    <- sort(unique(p.))
bin.width <- diff(un)[10]
breaks <- c(un - bin.width / 4, un + bin.width / 4)
histPlot(p., breaks = breaks, axes = FALSE, col = COL[2,2],
         xlab = "", ylab = "")
axis(1)
rect(0.42, 11 * m.fact, 0.58, 20 * m.fact,
     col = rgb(1,1,1,0.65), border = rgb(0,0,0,0))
text(0.5, 15.5 * m.fact, cex = 2,
     paste0("Tappers + Listeners"))




dev.off()
