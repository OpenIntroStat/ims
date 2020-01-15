setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/mammals")

library(openintro)
data(mammals)

oiB =  "#3E9BC0"


pdf("mammals_lifeSpanGest.pdf", 5.5, 4.3)
par(mar=c(3.8,3.8,0.5,0.5), las=1, mgp=c(2.7,0.7,0), cex.lab = 1.5, cex.axis = 1.25)

plot(mammals$LifeSpan ~ mammals$Gestation, xlab='Gestation (days)', ylab='Life Span (years)', pch=20, col=oiB)

dev.off()
