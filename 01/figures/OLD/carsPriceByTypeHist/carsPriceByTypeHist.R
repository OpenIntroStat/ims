
COL <- c('#228833AA', '#665511CC', '#002299')

ds <- density(cars$price[cars$type == 'small'])
dm <- density(cars$price[cars$type == 'midsize'])
dl <- density(cars$price[cars$type == 'large'])

yR <- c(0, max(c(ds$y, dm$y, dl$y)))
xR <- range(c(ds$x, dm$x, dl$x))

histPlot(cars$price[cars$type == 'small'], col='#ffffff', border=COL[1], probability=TRUE, xlim=xR, ylim=yR*1.1, xlab='price ($1000s)', ylab='', outline=TRUE, lty=1, axes=FALSE)
histPlot(cars$price[cars$type == 'midsize'], col='#ffffff', border=COL[2], probability=TRUE, add=TRUE, outline=TRUE, lty=2)
histPlot(cars$price[cars$type == 'large'], col='#ffffff', border=COL[3], probability=TRUE, add=TRUE, outline=TRUE, lty=3)
axis(1)

legend('topright', col=COL, lty=1:3, legend=c('small', 'midsize', 'large'))