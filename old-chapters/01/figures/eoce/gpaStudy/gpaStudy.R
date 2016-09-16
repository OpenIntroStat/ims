library(openintro)

setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/gpaStudy")

load("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/data/surveyS12.Rdata")

oiB =  "#3E9BC0"

pdf("gpaStudy.pdf", 5.5, 4.3)
par(mar=c(4,4.1,1,1), las=1, mgp=c(2.9,0.7,0))

plot(survey$gpa ~ survey$study_hours, xlab="Study hours/week", ylab="GPA", pch=20, col=fadeColor(oiB,80), cex.lab = 1.5, axes = FALSE)
axis(1, at = seq(0,70,20), cex.axis = 1.5)
axis(2, at = c(3,3.5,4), cex.axis = 1.5)
box()

dev.off()