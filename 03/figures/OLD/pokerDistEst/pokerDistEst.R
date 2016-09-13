
#===> data <===#
profit <- c(-110, -9, -60, 316, -200, -196, 320, -160, 31, 331, 1731, 21, -926, -475, 914, -300, -15, 1, -29, 829, 761, 227, -141, -672, 352, 385, 24, 103, -826, 95, 115, 39, -9, -1000, -35, -200, -200, 235, 70, 307, 135, 60, -100, -295, -1000, 361, -95, 337, 3712, -255)
profit <- c(profit, rnorm(1500, 0, 500), rgamma(500, 3, 12)*6000-1200, rgamma(500, 3, 20)*15000-1200)*.95-320
profit <- profit[profit > -500]
profit <- profit - 100
wts  <- (abs(profit - mean(profit))/sd(profit)+1) / sum(abs(profit - mean(profit))/sd(profit)+1)
dens <- density(profit, bw=500, weights=wts)
plot(dens); abline(h=0)

#===> plot <===#
par(las=1, mar=c(3,1,0,1), mgp=c(2,0.7,0))
plot(dens, axes=F, xlab='Winnings (dollars)', main='')
axis(1)
abline(h=0)
lines(rep(mean(profit),2), c(0,dens$y[which(abs(dens$x-mean(profit)) == min(abs(dens$x-mean(profit))))]), lty=3, col='#336699')
text(mean(profit), dens$y[which(abs(dens$x-mean(profit)) == min(abs(dens$x-mean(profit))))]/3,
paste('mean\n$', round(mean(profit)), sep=''), pos=4, col='#336699')