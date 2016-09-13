library(openintro)
data(COL)
library(xtable)
data(classData)



myPDF("classDataSBSBoxPlot.pdf", 5.5, 3.3, mgp=c(2.3, 0.5, 0), mar=c(3.4, 3.2, 0.5, 0.5))
boxPlot(classData$m1, classData$lecture, axes=FALSE, xlab="Lecture", ylab="Scores", lcol=COL[1], lwd=1.3, medianLwd=2.5)
axis(1, c(-50,1:3,50), c("", "A", "B", "C", ""))
axis(2, seq(0,100,20))
#box()
dev.off()

by(classData$m1, classData$lecture, length)
by(classData$m1, classData$lecture, mean)
by(classData$m1, classData$lecture, sd)

anova(lm(m1 ~ lecture, classData))
summary(lm(m1 ~ lecture, classData))
xtable(anova(lm(m1 ~ lecture, classData)))

