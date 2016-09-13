library(xtable)

DF    <- c(seq(0.5, 3, 0.5), 4:20, 25, 30, 40, 50)
tails <- c(0.3, 0.2, 0.1, 0.05, 0.02, 0.01, 0.005, 0.001)

cst <- matrix(NA, length(DF), length(tails))
for(i in 1:nrow(cst)){
	for(j in 1:ncol(cst)){
		cst[i,j] <- round(qchisq(1-tails[j], DF[i]), 2)
	}
}
colnames(cst) <- tails
row.names(cst) <- DF

xtable(cst)
