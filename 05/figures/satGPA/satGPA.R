require(openintro)

d <- read.delim('satGPA.txt')

plot(d$SATM, d$FYGPA, col=fadeColor(d$sex, '88'), pch=c(1,20)[d$sex], cex=c(1,1.5)[d$sex])
g <- lm(d$FYGPA ~ I(d$SATM))
summary(g)

pdf('satGPAAll.pdf', 5, 3.3)
par(mar=c(3, 3, 1, 1), mgp=c(1.8, 0.6, 0), las=1)
plot(d$SATM, d$FYGPA, #, col=fadeColor(d$sex, '88'), pch=c(1,20)[d$sex], cex=c(1,1.5)[d$sex],
col='#22558863', pch=20, cex=1.5,
xlab='SAT Math (percentile)', ylab='First Year GPA')
dev.off()

