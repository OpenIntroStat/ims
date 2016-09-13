setwd("~/Desktop/Open Intro/EOCE - Second Edition/05/figures/eoce/chicks")

data(chickwts)

summChickwts = matrix(nrow = length(levels(chickwts$feed)), ncol = 3)
colnames(summChickwts) = c("Mean","SD")
rownames(summChickwts) = levels(chickwts$feed)

for(i in 1:length(levels(chickwts$feed))){
	summChickwts[i,1] = mean(chickwts$weight[chickwts$feed == levels(chickwts$feed)[i]])
	summChickwts[i,2] = sd(chickwts$weight[chickwts$feed == levels(chickwts$feed)[i]])
	summChickwts[i,3] = length(chickwts$weight[chickwts$feed == levels(chickwts$feed)[i]])
	}
	
round(summChickwts,2)

###

pdf("chicks_box.pdf", height = 4, width = 8)

par(mar=c(2,4,0.5,0.5), las=1, mgp=c(3,0.7,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

boxPlot(chickwts$weight, fact = chickwts$feed, h = T, col = "#3E9BC0", horiz = FALSE, ylab = "Weight (in grams)")

dev.off()

###


pdf("chicks_ls_hb_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 19.41
u = 58.55
l = -58.55

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB, df = 9)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

pdf("chicks_cs_sb_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0.5), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 23.56
u = 77.15
l = -77.15

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB, df = 11)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

###

m = lm(weight ~ feed, data = chickwts)

anova(m)
summary(m)