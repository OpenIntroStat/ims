library(openintro)
library(ggplot2)
data(diamonds)

oiB = "#3E9BC0"

diamonds$ppc = diamonds$price/(diamonds$carat*100)
d = diamonds[diamonds$carat == 1 | diamonds$carat == 0.99,]

nn = d$ppc[d$carat == 0.99]
set.seed(123)
one = sample(d$ppc[d$carat == 1], size = 23, replace = FALSE)
ppc = c(nn,one)
carat = c(rep("0.99 carats",23), rep("1 carat",23))

###

pdf("diamonds_box.pdf", height = 3, width = 4)

par(mar=c(2,4,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)
boxPlot(ppc, fact = carat, ylab = "Point price (in dollars)", axes = FALSE)
axis(1, at = c(1,2), labels = c("0.99 carats","1 carat"))
axis(2, at = seq(20,80,20))

dev.off()

###

by(ppc, carat, mean)
by(ppc, carat, sd)

###

pdf("diamonds_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 4.36
u = 12.3
l = -12.3

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()