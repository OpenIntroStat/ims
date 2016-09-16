library(openintro)
load("surveyS12.Rdata")

oiB = "#3E9BC0"

survey_sub = survey[!is.na(survey$gpa) & !is.na(survey$major) & survey$gpa <= 4,]
levels(survey_sub$major) = c("Arts and Humanities", "Natural Sciences", "Social Sciences")

###

pdf("gpaMajor_box.pdf", height = 3, width = 8)

par(mar=c(2,4.5,0.5,3), mgp=c(2.5,0.7,0), las = 1, cex.lab = 1.25, cex.axis = 1.25)

boxPlot(survey_sub$gpa, fact = survey_sub$major, col = oiB, ylab = "GPA", axes = FALSE, xlim=c(0.6, 3.4))
axis(1, at = c(1,2,3), labels = c("Arts and Humanities", "Natural Sciences", "Social Sciences"))
axis(2, at = seq(2.7,3.9,0.3))

dev.off()

###


round(by(survey_sub$gpa, survey_sub$major, mean),2)
round(by(survey_sub$gpa, survey_sub$major, sd),2)
by(survey_sub$gpa, survey_sub$major, length)
