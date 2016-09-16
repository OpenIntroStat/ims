library(openintro)
data(COL)

set.seed(6)

nsim <- 1e4
n    <- 120
p    <- 0.5

X    <- matrix(sample(c(0,1), nsim * n, TRUE), nsim, n)
p.   <- apply(X, 1, sum) / n


un    <- sort(unique(p.))
bin.width <- diff(un)[10]
breaks <- c(un - bin.width / 4, un + bin.width / 4)
myPDF('TappersAndListenersNullDistribution.pdf', 6.5, 3.25,
      mar=c(3.7, 5.5, 0.5, 0.5), mgp=c(3.35,0.6,0))
histPlot(p., breaks = breaks, axes = FALSE, col = rgb(1,1,1),
         xlab = "", ylab = "Proportion of\nSimulated Scenarios")
axis(1)
axis(2, at = seq(0, 750, 250), labels = format(seq(0, 750, 250) / nsim))
lines(c(0.2, 0.2), c(0, 300), lty = 3, lwd = 3)
text(0.2, 300, "observed", pos = 3)
par(las = 0)
mtext("Simulated Correct Number of Guesses Out Of 120", 1, 2.5)
dev.off()

mean(p. <= 3)
