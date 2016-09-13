setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/gpaStudy")

load("surveyS12.Rdata")


pdf("gpaStudy.pdf", 5.5, 4.3)
par(mar=c(3.6,4.1,1,1), las=1, mgp=c(2.9,0.7,0))

plot(survey$gpa ~ survey$study_hours, xlab="Study hours/week", ylab="GPA", pch=20, col="#22558866", cex.lab = 1.5, cex.axis = 1.5)

dev.off()