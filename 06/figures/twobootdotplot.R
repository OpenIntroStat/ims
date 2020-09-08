##  R code for the dotplot in two proportion bootstrap
library(openintro)

set.seed(47)
nsim = 150
n1  = 7
n2 = 9
n = n1 + n2
v1 <- 3
v2 <- 5
var1 = c(c(rep("red", v1), rep("white", n1-v1)), c(rep("red", v2), rep("white", n2-v2)))
success = "red"
sim  = matrix(NA, nrow = n, ncol = nsim)
group = c(rep("first", n1), rep("second", n2))

data <- data.frame(var1, group)

diffs<-c()
for (i in 1:nsim){
 diffs[i] <- rbinom(1,n1,v1/n1)/n1 - rbinom(1,n2,v2/n2)/n2 
}

values <- table(diffs)

diffs_round <- round(diffs, 1)

X <- c()
Y <- c()
for(i in 1:length(diffs_round)){
  x  <- diffs_round[i]
  rec <- sum(diffs_round == x)
  X  <- append(X, rep(x, rec))
  Y  <- append(Y, 1:rec)
}

myPDF("twobootdotplot.pdf")
plot(X, Y, xlim=range(diffs)+c(-1,1)*sd(diffs)/4, xlab = "", ylab= "", axes = FALSE, ylim=c(0,max(Y)), col=COL[1], cex=0.5, pch=19, lwd=1)
axis(1, at = seq(-0.7,0.5,0.1), labels = c("",-0.6, "", -0.4,"",-0.2,"",0.0,"",0.2,"",0.4, ""))
abline(h=0)
dev.off()


propdiff <- matrix(ncol=9, nrow=8)
for(i in 1:8){
  for(j in 1:9){
    propdiff[i,j] = (i-1)/7 - (j-1)/8
  }
}
