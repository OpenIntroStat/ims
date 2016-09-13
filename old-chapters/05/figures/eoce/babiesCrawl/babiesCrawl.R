setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/babiesCrawl")

bc = read.csv("babiesCrawl.csv")

###

pdf("babiesCrawl.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.75,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(bc$avg_crawling_age ~ bc$temperature, xlab="Temperature (in F)", ylab="Average crawling age (in weeks)", pch=19, col=COL[1])

dev.off()

###

mean(bc$temperature)
sd(bc$temperature)

mean(bc$avgCrawlingAge)
sd(bc$avgCrawlingAge)

cor(bc$temperature, bc$avgCrawlingAge)