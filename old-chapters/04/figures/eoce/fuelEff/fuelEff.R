library(openintro)
d = read.csv("epa2012.csv")

oiB = "#3E9BC0"

###

man_rows = which(d$transmission == "M")
aut_rows = which(d$transmission == "A")

set.seed(3583)
man_rows_samp = sample(man_rows, 26)
aut_rows_samp = sample(aut_rows, 26)

d_samp = d[c(man_rows_samp,aut_rows_samp),]
d_samp$transmission = droplevels(d_samp$transmission)

levels(d_samp$transmission) = c("automatic","manual")

###

myPDF("fuelEff_hist_city.pdf", 3.5, mar=c(3.7,2,0.3,1), mgp=c(2.5,0.55,0))
boxPlot(d_samp$city_mpg, fact = d_samp$transmission, ylim = c(10,37), xlab = "City MPG", axes = FALSE, xlim=c(0.5, 2.5))
axis(1, at = c(1,2), labels = c("automatic","manual"))
axis(2, at = c(15,25,35))
dev.off()

###

myPDF("fuelEff_hist_hwy.pdf", 3.5, mar=c(3.7,2,0.3,1), mgp=c(2.5,0.55,0))
boxPlot(d_samp$hwy_mpg, fact = d_samp$transmission, ylim = c(10,37), xlab = "Hwy MPG", axes = FALSE, xlim=c(0.5, 2.5))
axis(1, at = c(1,2), labels = c("automatic","manual"))
axis(2, at = c(15,25,35))
dev.off()

###

by(d_samp$city_mpg, d_samp$transmission, mean)
by(d_samp$city_mpg, d_samp$transmission, sd)

by(d_samp$hwy_mpg, d_samp$transmission, mean)
by(d_samp$hwy_mpg, d_samp$transmission, sd)

###

pdf("fuelEff_city_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 1.13
u = 3.73
l = -3.73

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB, df = 25)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()