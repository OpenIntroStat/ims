library(openintro)
data(COL)

set.seed(8535)

gender <- c(rep('male', 24), rep('female', 24))
outcome <- c(rep(c('promoted', 'not promoted'), c(21, 3)), rep(c('promoted', 'not promoted'), c(14, 10)))

nsim  = 100
n     = length(gender)
group = gender
var1  = outcome
success = "promoted"
sim   = matrix(NA, nrow = n, ncol = nsim)
n1    = n2 = 24

statistic <- function(var1, group){	
	t1 <- var1 == success & group == levels(as.factor(group))[1]
	t2 <- var1 == success & group == levels(as.factor(group))[2]
	sum(t1)/n1 - sum(t2)/n2 
}

for(i in 1:nsim){
	sim[,i] = sample(group, n, replace = FALSE)
}

sim_dist = apply(sim, 2, statistic, var1 = outcome)
diffs    = sim_dist
pval     = sum(diffs >= 0.29) / nsim
values  <- table(sim_dist)


X <- c()
Y <- c()
for(i in 1:length(diffs)){
	x   <- diffs[i]
	rec <- sum(sim_dist == x)
	X   <- append(X, rep(x, rec))
	Y   <- append(Y, 1:rec)
}


myPDF('discRandDotPlot.pdf', mar=c(3.4, 0.5, 0.5, 0.5), mgp=c(2.35,0.6,0))
plot(X, Y, xlim=range(diffs)+c(-1,1)*sd(diffs)/4, xlab = "Difference in promotion rates", axes = FALSE, ylim=c(0,max(Y)), col=COL[1], cex=0.8, pch=1, lwd=1.5)
axis(1, at = seq(-0.4,0.4,0.1), labels = c(-0.4,"",-0.2,"",0,"",0.2,"",0.4))
abline(h=0)
theta <- seq(0, 2*pi, length.out = 500)
x     <- 0.335 + 0.08 * cos(theta)
y     <- 1 + 1 * sin(theta)
#lines(x,y)
points(X[X > 0.25], Y[X > 0.25], lwd=3, col = COL[4], cex=0.4)
dev.off()