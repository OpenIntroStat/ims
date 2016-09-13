library(xtable)

#===> negative Z table <===#
z <- matrix(NA, 39, 10)
for(i in 1:39){
	for(j in 1:9){
		z[i,j] <- -((39-i)/10 + (10-j)/100)+0.01
	}
}
Z <- matrix(NA, 39, 10)
for(i in 1:39){
	for(j in 1:9){
		hold <- format(c(round(pnorm(z[i,j]), 4), 0.1234))[1]
		Z[i,j] <- paste('scriptsize{', hold, '}', sep='')
	}
	hold <- format(c(z[i,9], 0.1))[1]
	Z[i,10] <- paste('$', hold, '$', sep='')
}
hold <- as.character(format(c(round(pnorm(seq(-3.89, -0.09, 0.1)),4),0.0001))[1:39])
rownames(Z) <- paste('scriptsize{', hold, '}', sep='')
colnames(Z) <- format(seq(0.08,-0.01,-0.01))
xtable(Z[5:39,])

#===> positive Z table <===#
z <- matrix(NA, 39, 10)
for(i in 1:39){
	for(j in 1:10){
		z[i,j] <- (i-1)/10 + (j-1)/100
	}
}
Z <- matrix(NA, 39, 10)
for(i in 1:39){
	for(j in 1:10){
		hold <- format(c(round(pnorm(z[i,j]), 4), 0.1234))[1]
		Z[i,j] <- paste('scriptsize{', hold, '}', sep='')
	}
}
hold <- as.character(format(seq(0, 3.8, 0.1)))
rownames(Z) <- hold
colnames(Z) <- format(seq(0,0.09,0.01))
xtable(Z[1:35,])

