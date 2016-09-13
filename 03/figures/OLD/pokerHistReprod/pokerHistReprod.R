
#===> data <===#
profit <- c(-110, -9, -60, 316, -200, -196, 320, -160, 31, 331, 1731, 21, -926, -475, 914, -300, -15, 1, -29, 829, 761, 227, -141, -672, 352, 385, 24, 103, -826, 95, 115, 39, -9, -1000, -35, -200, -200, 235, 70, 307, 135, 60, -100, -295, -1000, 361, -95, 337, 3712, -255)
CS <- cumsum(profit)/1:50

#===> plot <===#
par(las=1, mar=c(3,1,0,1), mgp=c(2,0.7,0))
hist(profit, axes=F, xlab='Winnings (dollars)', xlim=c(-1000, 4000), main='')
axis(1)
abline(v=mean(profit), lty=3)
#par(las=1, mar=c(4,4,0,2), mfrow=c(2,1))
#hist(profit, main='', xlab='profit (dollars)',
#	breaks=seq(-1000,4000,400))
#hist(profit1, main='', xlab='profit (dollars)', breaks=seq(-250, 650, 100))
