library(openintro)
data(COL)

load("gss2010.Rda")

gss = gss2010

gss_sub = gss[which(!is.na(gss$hrs1) & !is.na(gss$degree)), ]
gss_sub = gss_sub[, which(names(gss_sub) == "degree" | names(gss_sub) == "hrs1")]
levels(gss_sub$degree) = c("Less than HS","HS","Jr Coll","Bachelor's","Graduate")

###

#setwd("~/Desktop/Open Intro/EOCE - Second Edition/05/figures/eoce/workDeg")

gss_sub$edu = NA
gss_sub$edu[gss_sub$degree == "Less than HS" | gss_sub$degree == "HS"] = "hs or lower" 
gss_sub$edu[gss_sub$degree == "Jr Coll" | gss_sub$degree == "Bachelor's" | gss_sub$degree == "Graduate"] = "coll or higher" 
gss_sub$edu = as.factor(gss_sub$edu)

pdf("workDeg_work_edu_hist.pdf", height = 4, width = 6)
par(mar=c(3.5,2.5,1,.5), las = 1, mgp=c(2.3,0.7,0), mfrow=c(2,1))
histPlot(gss_sub$hrs1[gss_sub$edu == "coll or higher"], xlim = c(0,90), xlab = "", col=COL[1], ylab = "", ylim = c(0,200), axes = FALSE)
axis(1)
axis(2, at = c(0,100,200))
text(x = 60, y = 150, "College degree", pos = 4)
histPlot(gss_sub$hrs1[gss_sub$edu == "hs or lower"], xlim = c(0,90), xlab = "Hours worked per week",col=COL[1], ylab = "", axes = FALSE)
axis(1)
axis(2, at = c(0,125,250))
text(x = 60, y = 200, "No college degree", pos = 4)
dev.off()

###

pdf("workDeg_work_edu_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 0
s = 0.89
u = 2.4
l = -2.4

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = COL[1])
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.5)

dev.off()

pdf("workDeg_work_edu_raw_box.pdf", height = 2.5, width = 8)

par(mar=c(2,3.5,0.5,.5), mgp=c(2.3,0.7,0), las = 1)

boxPlot(gss_sub$hrs1, fact = gss_sub$degree, col = fadeColor(COL[1],50), ylab = "Hours worked per week", xlim=c(0.6, 5.4))
dev.off()

###

round(by(gss_sub$hrs1, gss_sub$degree, mean),2)
round(by(gss_sub$hrs1, gss_sub$degree, sd),2)
by(gss_sub$hrs1, gss_sub$degree, length)

###

anova(lm(gss_sub$hrs1 ~ gss_sub$degree))