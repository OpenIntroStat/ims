library(openintro)
data(COL)
load("orings.rda")
set.seed(17)

myPDF("oringsData.pdf", 4.5, 2.7, mar=c(3.2, 3.7, 0.8, 0.8), mgp=c(2.5, 0.55, 0))
these <- orings[,1] %in% c(67, 70, 76)
plot(orings[,1]+c(rep(0, 5), c(-0.1, 0, 0.1), 0, 0, -0.07, -0.07, 0.07, 0.07, rep(0, 4), -0.07, 0.07, 0, 0, 0), orings[,2]/6, xlab="", ylab="Probability of damage", xlim=c(50, 82), ylim=c(0,1), col=COL[1,3], pch=19)
mtext("Temperature (Fahrenheit)", 1, 2)
#xtable(summary(g <- glm(cbind(orings[,2], 6-orings[,2]) ~ orings[,1], binomial)))
# lines(orings[,1], predict(g, type="response"))

dev.off()