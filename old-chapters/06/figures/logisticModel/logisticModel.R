library(openintro)
data(COL)
library(splines)
data(email)
e <- email
e$cc       <- ifelse(email$cc > 0, 1, 0)
e$attach   <- ifelse(email$attach > 0, 1, 0)
e$dollar   <- ifelse(email$dollar > 0, 1, 0)
e$inherit  <- ifelse(email$inherit > 0, 1, 0)
e$password <- ifelse(email$password > 0, 1, 0)
g <- glm(spam ~ to_multiple + winner + format + 
                re_subj + exclaim_subj +
                attach + dollar +
                inherit + password, # +
                #num_char + line_breaks + exclaim_mess,
                data=e, family=binomial)
summary(g)
p  <- predict(g, type="response")
p. <- p

set.seed(1)
myPDF("logisticModelPredict.pdf", 8, mar=c(3.9, 6, 0.5, 0.5), mgp=c(2.4, 0.55, 0))
noise <- rnorm(nrow(e), sd=0.08)
plot(p, e$spam+noise,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=fadeColor(COL[1], "22"), pch=20)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))
dev.off()



ns1 <- 7
myPDF("logisticModelSpline.pdf", 7.7, 4.9, mar=c(3.9, 6.6, 0.5, 0.2), mgp=c(2.4, 0.55, 0))
plot(p, e$spam+noise/5, type="n",
     xlim=0:1, ylim=c(-0.07,1.07), axes=FALSE,
     xlab="Predicted probability", ylab="")
par(las=0)
mtext("Truth", 2, 5.5)
par(las=1)
rect(0,0,1,1, border=COL[6], col="#00000000", lwd=1.5)
lines(c(0,1), c(0,1), lty=2, col=COL[6], lwd=1.5)
arrows(0.83, 0.57, 0.8, 0.785, length=0.07)
text(0.88, 0.48, "What we expect if\nthe logistic model\nis reasonable", cex=0.75)
points(p, e$spam+noise/5, col=fadeColor(COL[1], "18"), pch=20)
axis(1)
axis(2, at=c(0,0.2,0.4,0.6,0.8,1), labels=c("0 (not spam)", "0.2  ", "0.4  ", "0.6  ", "0.8  ", "1 (spam)"))
g1 <- lm(e$spam ~ ns(p, ns1))
p  <- seq(0, max(p), length.out=200)
Y  <- predict(g1, data.frame(ns(p, ns1)), se.fit=TRUE)
#abline(g1)
yb <- Y$fit - 1.96*Y$se.fit
yt <- rev(Y$fit + 1.96*Y$se.fit)
polygon(c(p, rev(p)), c(yb, yt), col=COL[3,3], border="#00000000")
lines(p, Y$fit, lwd=2.5)
arrows(0.36, 0.54, 0.45, 0.52, length=0.07)
text(0.25, 0.6, "Locally-estimated\nprobabilities with\nconfidence bounds", cex=0.75)
arrows(0.6, 0.36, 0.7, 0.61, length=0.07)
text(0.6, 0.27, "The bounds become wide\nbecause not much data\nare found this far right", cex=0.75)
dev.off()


p  <- p.



# _________________________________________________________________
#
# The Timing Below Isn't Precisely Correct, But It Is Close
# _________________________________________________________________


ns2 <- 10
myPDF("logisticModelResidual.pdf", 8, 6, mar=c(4.9, 6, 0.5, 0.5), mgp=c(2.4, 0.55, 0), mfrow=2:1)
noise <- rnorm(nrow(e), sd=0.08)
res   <- e$spam - p
plot(e$time, res, axes=FALSE,
     xlab="Time email was sent", ylab="Residual",
     col=COL[1,4], pch=20)
TR  <- range(as.numeric(e$time))
DR  <- diff(TR)
Mo  <- TR[1] + c(0, DR*31, DR*59, DR*90)/90
axis(1, Mo, rep("", 4), tcl=-0.7)
axis(1, (Mo[-1] + Mo[-length(Mo)])/2, c("January", "February", "March"), tcl=0)
axis(2)
Time <- e$time
g2   <- lm(res ~ ns(Time, ns2))
Time <- seq(TR[1], TR[2], length.out=200)
Y    <- predict(g2, ns(Time, ns2), se.fit=TRUE)
abline(h=0, lty=2, col="#00000088")
yb <- Y$fit - 1.96*Y$se.fit
yt <- rev(Y$fit + 1.96*Y$se.fit)
polygon(c(Time, rev(Time)), c(yb, yt), col="#E0E317B5", border="#00000000")
lines(Time, Y$fit, lwd=1.75)
#axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))
#dev.off()



ns2 <- 10
#myPDF("logisticModelResidual.pdf", 8, mar=c(3.9, 6, 0.5, 0.5), mgp=c(2.4, 0.55, 0))
par(mar=c(3.9, 6, 1.5, 0.5))
noise <- rnorm(nrow(e), sd=0.08)
res   <- e$spam - p
TR  <- range(as.numeric(e$time))
plot(e$time, res, axes=FALSE,
     xlab="January", ylab="Residual",
     col="#22558855", pch=20, xlim=c(TR[1], quantile(TR, 0.08)))
DR  <- diff(TR)
Mo  <- TR[1] + c(0, DR*1:10)/90
axis(1, Mo, rep("", 11), tcl=-0.7)
axis(1, (Mo[-1] + Mo[-length(Mo)])/2, 1:10, tcl=0)
axis(2)
dev.off()



