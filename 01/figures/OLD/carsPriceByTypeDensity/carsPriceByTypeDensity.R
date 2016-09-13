
COL <- c('#228833', '#665511', '#002299')

ds <- density(cars$price[cars$type == 'small'])
dm <- density(cars$price[cars$type == 'midsize'])
dl <- density(cars$price[cars$type == 'large'])

yR <- c(0, max(c(ds$y, dm$y, dl$y)))
xR <- range(c(ds$x, dm$x, dl$x))

x <- 0
y <- 0
par(mar=c(3.5, 1, 1, 1), mgp=c(2.4, 0.7, 0), las=1)
plot(x, y, type='n', xlim=xR, ylim=yR, axes=FALSE, xlab='price ($1000s)', ylab='')
axis(1)
lines(ds$x, ds$y, col=COL[1])
lines(dm$x, dm$y, col=COL[2], lty=2)
lines(dl$x, dl$y, col=COL[3], lty=3)
abline(h=0)

legend('topright', col=COL, lty=1:3, legend=c('small', 'midsize', 'large'))