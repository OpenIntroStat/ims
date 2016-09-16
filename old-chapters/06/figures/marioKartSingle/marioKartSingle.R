library(xtable)
library(openintro)
data(COL)
data(marioKart)
toss      <- which(marioKart$totalPr > 80)
keep      <- c("totalPr", "cond", "stockPhoto", "duration", "wheels", "shipSp")
d         <- marioKart[-toss, keep]
d$stockPhoto <- (d$stockPhoto == "yes") + 0
d$cond    <- (d$cond == "new") + 0
thisOne   <- names(d) == "cond"
names(d)[thisOne] <- "condNew"
d$shipSp  <- as.character(d$shipSp)
these     <- d$shipSp %in% c("firstClass", "priority", "parcel", "media")
d$shipSp[these] <- "usps"
these     <- d$shipSp %in% c("ups3Day", "upsGround")
d$shipSp[these] <- "ups"
these     <- d$shipSp %in% c("other", "standard")
d$shipSp[these] <- "unknown"
d$shipSp  <- as.factor(d$shipSp)
d         <- d[,-which(colnames(d) == "shipSp")]


#e <- fit$res
#f <- fit$fit

myPDF("marioKartSingle.pdf", 5, 3.8, mar=c(3.7, 3.7, 0.5, 0.5), mgp=c(2.5,0.55,0)) #, mfrow=1:2)

plot(d$condNew, d$totalPr, xlim=c(-0.15, 1.15), ylim=c(25, 75), axes=FALSE, col=COL[1,3], pch=19, cex=1.3, xlab="", ylab="Price")
axis(2, at=seq(30, 70, 10))
par(mgp=c(2.5,1.55,0))
axis(1, at=0:1, labels=c("0\n(used)", "1\n(new)"))
par(mgp=c(2.5,0.55,0))
mtext("Condition", 1, 2.6)
g <- lm(d$totalPr ~ d$cond)
abline(g, col=COL[5], lwd=1.5)

# par(mar=c(3.7, 5.7, 0.5, 0.5))

# plot(d$duration, d$totalPr, xlim=c(0.3, 10.3), ylim=c(25, 75), axes=FALSE, col="#22558866", pch=19, cex=1.3, xlab="", ylab="Price")
# axis(2, at=seq(30, 70, 10))
# #par(mgp=c(2.5,1.55,0))
# axis(1) #, at=0:1, labels=c("0\n(used)", "1\n(new)"))
# par(mgp=c(2.5,0.55,0))
# mtext("Duration", 1, 2.6)
# g <- lm(d$totalPr ~ d$duration)
# abline(g, col="#AA5500", lwd=2)

dev.off()

