library(openintro)
d = read.table("cleSac.txt", h = T, sep = "\t")

d = d[!is.na(d$Total_personal_income),]

set.seed(8957)
sac = sample(d$Total_personal_income[d$Metropolitan_area_Detailed == "Sacramento_ CA"], 17)
cle = sample(d$Total_personal_income[d$Metropolitan_area_Detailed == "Cleveland_ OH"], 21)

oiB = "#3E9BC0"

###

pdf("cleSac_hist.pdf", height = 5, width = 7)

par(mar=c(3.7,2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(2,1), cex.lab = 1.25)

histPlot(cle, xlim = c(0,180000), ylab = "",xlab = "", col = oiB, breaks = 8, axes = FALSE)
axis(1, at = seq(0,180000,45000))
axis(2, at = seq(0,10,5))
text(x = 130000, y = 8, labels = "Cleveland, OH", pos = 4, cex = 1.25)

histPlot(sac, xlim = c(0,180000), ylab = "", xlab = "Total personal income", col = oiB, breaks = 8, axes = FALSE, ylim = c(0,10))
axis(1, at = seq(0,180000,45000))
axis(2, at = seq(0,10,5))
text(x = 130000, y = 8, labels = "Sacramento, CA", pos = 4, cex = 1.25)

dev.off()

###

mean(cle, na.rm = TRUE)
sd(cle, na.rm = TRUE)
length(cle)


mean(sac, na.rm = TRUE)
sd(sac, na.rm = TRUE)
length(sac)