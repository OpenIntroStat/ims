load("stockBehavior.RData")

# we want to analyze how many days it takes
# before we observe "up" days

(R <- rev(d$R[139:5181,1]))

signs <- (R <= 0)
p <- sum(!signs)/length(signs)
si <- signs
streaks <- 0
k <- 0
n <- 0
for(i in 1:length(R)){
	if(signs[i]){
		n  <- n+1
	} else {
		k <- k+1
		n <- n+1
		streaks[k] <- n
		n <- 0
	}
}
histPlot(streaks, breaks=seq(0.25, 13.25, 0.5))

counts <- table(as.character(streaks))
Names  <- names(counts)
Order  <- order(as.numeric(names(counts)))
counts <- matrix(counts)[Order,]
names(counts) <- Names[Order]

counts[7] <- sum(counts[7:length(counts)])
(counts <- counts[1:7])
frac   <- (1-p)^(0:5)*p
props <- c(frac, 1-sum(frac))

(expCounts <- sum(counts)*props)
diffs <- counts - expCounts
X2 <- sum(diffs^2/expCounts)
1-pchisq(X2, length(diffs)-1)
