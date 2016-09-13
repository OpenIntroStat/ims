setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/associationPlots")

oiB =  "#3E9BC0"

set.seed = 2453
x = seq(0, 10, 0.1)

# positive linear
y_poslin = x * runif(1, min = 0, max = 4) + rnorm(length(x), mean = 0, sd = runif(1, min = 3, max = 4)) - runif(1, min = 0, max = 5)

# negative linear
y_neglin = x * -runif(1, min = 0, max = 4) + rnorm(length(x), mean = 0, sd = runif(1, min = 3, max = 4)) - runif(1, min = 0, max = 5)

# curved positive
y_poscur = x^2 + rnorm(length(x), mean = 0, sd = runif(1, min = 3, max = 4))

# no association
y_none = x + rnorm(length(x), mean = 0, sd = runif(1, min = 30, max = 40))


# Plotting

pdf("associationPlots.pdf", 5.5, 4.3)

par(mar=c(2.5,0.5,0.5,0.5), las=1, mgp=c(1,0.5,0), mfrow = c(2,2))

# Save as AssociationPlots
plot(y_poslin ~ x, yaxt = "n", xaxt = "n", xlab = "(1)", ylab = "", cex.lab = 1.75, pch=20, col=oiB)

plot(y_none ~ x, yaxt = "n", xaxt = "n", xlab = "(2)", ylab = "", cex.lab = 1.75, pch=20, col=oiB)

plot(y_poscur ~ x, yaxt = "n", xaxt = "n", xlab = "(3)", ylab = "", cex.lab = 1.75, pch=20, col=oiB)

plot(y_neglin ~ x, yaxt = "n", xaxt = "n", xlab = "(4)", ylab = "", cex.lab = 1.75, pch=20, col=oiB)

dev.off()