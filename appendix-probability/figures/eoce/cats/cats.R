setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/02/figures/eoce/cats")

library(MASS)
data(cats)

oiB =  "#3E9BC0"

# hist - weights

pdf("cats_bodyWeight.pdf", 5.5, 4.3)
par(mar=c(4.2,2,0.5,0.5), las=1, mgp=c(3,0.7,0))

hist(cats$Bwt, breaks = seq(2,4,0.25), ylim = c(0,35), xlab = "Body Weight", col = oiB, main = "", cex.lab = 1.25, cex.axis = 1.25, axes = FALSE)
axis(1)
axis(2, at = seq(5,35,10))

dev.off()


# hist - weights soln

pdf("cats_bodyWeightSoln.pdf", 5.5, 4.3)
par(mar=c(4.2,2,0.5,0.5), las=1, mgp=c(3,0.7,0))

hist(cats$Bwt, breaks = seq(2,4,0.25), ylim = c(0,35), xlab = "Body Weight", col = oiB, main = "", cex.lab = 1.25, cex.axis = 1.25, axes = FALSE)
axis(1)
axis(2, at = seq(5,35,10))

counts = sum(cats$Bwt <= 2.25)
for(i in 1:7){
	counts = c(counts, sum(cats$Bwt > (2 + i*0.25) & cats$Bwt <= (2 + 0.25 + i*0.25)))
	}
abline(h = counts, lty = 3)

text(x = 2.125, y = counts[1]+2, paste(counts[1]))
for(i in 2:8){
	text(x = 2 + i*0.25 - 0.125, y = counts[i]+2, paste(counts[i]))
	}

dev.off()

# not used

# hist - weights by gender

pdf("cats_bodyWeightGender.pdf", 11, 3)
par(mar=c(4.2,2,0.5,0.5), las=1, mgp=c(3,0.7,0), mfrow = c(1,2), cex.lab = 1.25)

hist(cats$Bwt[cats$Sex == "F"], breaks = seq(2,4,0.25), ylim = c(0,22), xlab = "Body Weight (Female)", border = '#225588', col = fadeColor('#225588', '55'), main = "")

hist(cats$Bwt[cats$Sex == "M"], breaks = seq(2,4,0.25), ylim = c(0,22), xlab = "Body Weight (Male)", border = '#225588', col = fadeColor('#225588', '55'), main = "")

dev.off()


