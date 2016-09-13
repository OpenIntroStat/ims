library(openintro)
data(COL)
set.seed(1)
tr <- rep(1:2, c(50, 40))
su <- c(rep(c("s", "d"), c(11, 39)), rep(c("s", "d"), c(14, 26)))

N <- 10^5
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
myPDF("CPR_study_right_tail.pdf",
      5*1.35, 2.3*1.35, mar = c(2, 2.5, 0.5, 0.5))
hist(d, breaks = breaks, col=COL[7,3], main="", xlab="Differences under the null hypothesis", ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c(0, NA, NA, 3)/20)
hist(d[d > 0.1299], breaks = breaks, col=COL[1], add=TRUE)
abline(h=0)
lines(rep(0.13, 2), c(0, 3)*N/25, lty=3, lwd=1.7)
text(0.13, 3*N/25, "0.13", pos=3, cex=0.7)
dev.off()

myPDF("CPR_study_p_value.pdf",
      5*1.35, 2.3*1.35, mar = c(2, 2.5, 0.5, 0.5))
hist(d, breaks = breaks, col=COL[7,3], main="", xlab="Differences under the null hypothesis", ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c(0, NA, NA, 3)/20)
hist(d[d > 0.1299], breaks = breaks, col=COL[1], add=TRUE)
abline(h=0)
hist(d[d < -0.1299], breaks = breaks, col=COL[1], add=TRUE)
abline(h=0)
lines(rep(0.13, 2), c(0, 3)*N/25, lty=3, lwd=1.7)
text(0.13, 3*N/25, "0.13", pos=3, cex=0.7)
dev.off()

myPDF("CPR_study_p_value_w_normal.pdf",
      5*1.35, 2.3*1.1, mar = c(2, 1.5, 0.5, 0.5))
hist(d, breaks = breaks, col=COL[7,3], main="", xlab="Differences under the null hypothesis", ylab="", axes=FALSE)
axis(1)
# axis(2, at=(0:3)*N/20, labels=c(0, NA, NA, 3)/20)
x0 <- seq(-.5, .5, length.out = 1000)
y0 <- dnorm(x0, 0, 0.095)
lines(x0, N * y0 / 23)
hist(d[d > 0.1299], breaks = breaks, col=COL[1], add=TRUE)
abline(h=0)
hist(d[d < -0.1299], breaks = breaks, col=COL[1], add=TRUE)
abline(h=0)
lines(rep(0.13, 2), c(0, 3)*N/25, lty=3, lwd=1.7)
text(0.13, 3*N/25, "0.13", pos=3, cex=0.7)
dev.off()

myPDF("CPR_study_p_value_normal_only.pdf",
      5*0.8, 2.3*0.7, mar = c(2, 0.5, 0.2, 0.5))
normTail(0, 0.1, -0.13, 0.13, col = COL[1])
dev.off()
