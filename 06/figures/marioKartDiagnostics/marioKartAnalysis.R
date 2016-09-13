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

summary(lm(totalPr ~ ., d))
summary(lm(totalPr ~ condNew + stockPhoto + duration + wheels, d))
xtable(summary(lm(totalPr ~ condNew + stockPhoto + wheels, d)))
xtable(summary(fit <- lm(totalPr ~ condNew + wheels, d)))

e <- fit$res
f <- fit$fit

myPDF("mkDiagnosticNormalQuantilePlot.pdf", 5.5, 4.4, mgp=c(2.5,0.6,0))
qqnorm(e, ylab="Residuals", main="", col=COL[1,2], pch=19)
dev.off()

myPDF("mkDiagnosticInOrder.pdf", 6.5/1.15, 5.3/1.15, mgp=c(2.5,0.6,0))
plot(e, xlab="Order of collection", ylab="Residuals", axes=FALSE)
axis(1)
axis(2, seq(-10,10,10))
rect(-10,-50,200,50,col=COL[7,3])
abline(h=seq(-50,50,10),col="#FFFFFF",lwd=3)
abline(h=seq(-50,50,5),col="#FFFFFF",lwd=1)
points(e, col=COL[1,2], pch=19)
box()
dev.off()

myPDF("mkDiagnosticEvsF.pdf", 6.5/1.15, 5.3/1.15, mgp=c(2.5,0.6,0))
plot(f, e, xlab="Fitted values", ylab="Residuals", axes=FALSE)
axis(1)
axis(2, seq(-10,10,10))
rect(-10,-50,100,50,col=COL[7,3])
abline(h=seq(-50,50,10),col="#FFFFFF",lwd=3)
abline(h=seq(-50,50,5),col="#FFFFFF",lwd=1)
points(f, e, col=COL[1,2], pch=19)
box()
dev.off()

myPDF("mkDiagnosticEvsAbsF.pdf", 6.5/1.15, 5.3/1.15, mgp=c(2.5,0.6,0))
plot(f, (abs(e)), xlab="Fitted values", ylab="Absolute value of residuals", axes=FALSE)
axis(1)
axis(2, seq(-10,10,5))
rect(-10,-50,100,50,col=COL[7,3])
abline(h=seq(-50,50,10),col="#FFFFFF",lwd=3)
abline(h=seq(-50,50,5),col="#FFFFFF",lwd=1)
points(f, (abs(e)), col=COL[1,2], pch=19)
box()
dev.off()

myPDF("mkDiagnosticEvsVariables.pdf", 6.5, 8.3, mgp=c(2,0.6,0), mfrow=c(2,1))
par(mar=c(5.1, 3.1, 0.9, 0.5))
boxPlot(e, d$condNew, xlab="Condition", ylab="Residuals", axes=FALSE)
axis(1, at=1:2, c("Used", "New"))
axis(2, seq(-10,10,10))
rect(-10,-50,100,50,col=COL[7,3])
abline(h=seq(-50,50,10),col="#FFFFFF",lwd=3)
abline(h=seq(-50,50,5),col="#FFFFFF",lwd=1)
boxPlot(e, d$condNew, add=1:2, axes=FALSE)
dotPlot(e[d$condNew==0], vertical=TRUE, at=1.05, add=TRUE, col=COL[1,2], pch=19, cex=0.7)
dotPlot(e[d$condNew==1], vertical=TRUE, at=2.05, add=TRUE, col=COL[1,2], pch=19, cex=0.7)
box()

par(mar=c(3.8, 3.1, 2.2, 0.5))
plot(d$wheels, e, xlab="Number of wheels", ylab="Residuals", axes=FALSE)
axis(1)
axis(2, seq(-10,10,10))
rect(-10,-50,100,50,col=COL[7,3])
abline(h=seq(-50,50,10),col="#FFFFFF",lwd=3)
abline(h=seq(-50,50,5),col="#FFFFFF",lwd=1)
points(d$wheels, e, col=COL[1,2], pch=19)
box()
dev.off()


fit <- lm(totalPr ~ condNew + wheels + I(wheels^2), d)

plot(fit)


fit1 <- lm(totalPr ~ duration + condNew + stockPhoto + wheels, d)
fit2 <- lm(totalPr ~ condNew + stockPhoto + wheels, d)
anova(fit1, fit2)

fit1 <- lm(totalPr ~ condNew + stockPhoto, d)
fit2 <- lm(totalPr ~ stockPhoto, d)
anova(fit1, fit2)



