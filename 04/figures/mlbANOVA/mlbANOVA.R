rm(list=ls())
library(xtable)
library(openintro)
data(COL)
data(mlbBat10)
d   <- mlbBat10[mlbBat10$AB > 200,]
pos <- list(c("OF"), c("1B", "2B", "3B", "SS"), "DH", "C")
POS <- c("OF", "IF", "DH", "C")

out <- c()
gp  <- c()
for(i in 1:length(pos)){
	these <- which(d$pos %in% pos[[i]])
	out   <- c(out, d[these,"OBP"]) #d[these,"HR"] / d[these,"AB"])
	gp    <- c(gp, rep(POS[i], length(these)))
}
DF  <- data.frame(d, gp=gp)
mod <- lm(out ~ as.factor(gp))
summary(mod)
anova(mod)
xtable(summary(mod))
xtable(anova(mod), digits=4)
#plot(mod)


myPDF("mlbANOVABoxPlot.pdf", 6, 4)
boxPlot(out, gp, xlab="Position", ylab="On base percentage", axes=FALSE, pchCex=1, key=POS, col=COL[1,3], lcol=COL[1])
axis(1, 1:4, POS)
axis(2) #, at=seq(0, 0.1, 0.05))
dev.off()

xtable(rbind(by(out, gp, length),
		by(out, gp, mean),
		by(out, gp, sd)), digits=3)




g <- rep(1:3, c(10, 1000, 1000))
x <- c()
for(i in 1:3){
	n <- sum(g == i)
	x <- c(x, rnorm(n))
}
sum(by(x, g, length)*(by(x, g, mean) - mean(x))^2)/2
anova(lm(x ~ as.factor(g)))



uTeams <- unique(mlbBat10$team)
nTeams <- length(uTeams)
myPDF("mlbANOVADiagIndepOfTeam.pdf", 5, 4)
dotPlot(mod$res, mlbBat10$team, key=uTeams, ylim=c(0, nTeams), axes=FALSE, ylab="Teams", xlab="Residuals", col=COL[1])
axis(1)
axis(2, 1:nTeams, uTeams, cex.axis=0.5)
abline(h=1:nTeams, col=COL[7], lwd=0.5)
abline(h=seq(1, nTeams, 5), col=COL[6], lwd=1.5)
dev.off()


myPDF("mlbANOVADiagNormality.pdf", 5, 4, mar=c(3.5, 4.4, 0.5, 0.5))
qqnorm(mod$res, main="", ylab="", xlab="", pch=20, cex=0.7, col=COL[1,3])
mtext("Theoretical Quantiles", 1, 2.2)
par(las=0)
mtext("Residuals", 2, line=3.3)
dev.off()


myPDF("mlbANOVADiagNormalityGroups.pdf", 1.5*5, 1.5*4, mar=c(4.5, 4.4, 2, 0.5), mfrow=c(2,2))
qqnorm(out[gp == "OF"], main="Outfielders", ylab="", xlab="", pch=19, cex=0.8, col=COL[1,3])
mtext("Theoretical Quantiles", 1, 2.2)
qqnorm(out[gp == "IF"], main="In-fielders", ylab="", xlab="", pch=19, cex=0.8, col=COL[1,3])
mtext("Theoretical Quantiles", 1, 2.2)
qqnorm(out[gp == "DH"], main="Designated Hitters", ylab="", xlab="", pch=19, cex=0.8, col=COL[1,3], axes=FALSE); axis(1); axis(2, at=seq(0.3, 0.4, 0.05)); box()
mtext("Theoretical Quantiles", 1, 2.2)
qqnorm(out[gp == "C"], main="Catchers", ylab="", xlab="", pch=19, cex=0.8, col=COL[1,3])
mtext("Theoretical Quantiles", 1, 2.2)
par(las=0)
mtext("Residuals", 2, line=3.3)
dev.off()


myPDF("mlbANOVADiagConstantVar.pdf", 5, 4, mar=c(3.5, 4.4, 0.5, 0.5))
boxPlot(mod$res, gp, main="", ylab="", xlab="", pch=20, cex=0.7, col=COL[1,3], lcol=COL[1])
mtext("Position", 1, 2.2)
par(las=0)
mtext("Residuals", 2, line=3.3)
dev.off()



anova(lm(OBP ~ team + gp, DF))
anova(lm(OBP ~ gp + team, DF))

