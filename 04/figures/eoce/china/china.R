library(openintro)
data(COL)

china = read.csv("china.csv")

china = china[!is.na(china$gender) & !is.na(china$child_care) & !is.na(china$edu) & china$child_care != -99 & china$edu != 9,]

china$edu[china$edu == 1] = "primary school"
china$edu[china$edu == 2] = "lower middle school"
china$edu[china$edu == 3] = "upper middle school"
china$edu[china$edu == 4] = "technical or vocational"
china$edu[china$edu == 5] = "college"
china$edu[china$edu == 6] = "master or higher"



china$gender[china$gender == 1] = "male"
china$gender[china$gender == 2] = "female"

###

by(china$child_care, china$gender, mean)
by(china$child_care, china$gender, sd)
by(china$child_care, china$gender, length)

###

pdf("china_edu_box.pdf", 15, 4)

par(mar=c(2, 4.5, 0, 0), las=1, mgp=c(2.7,0.7,0), mfrow = c(1,1), cex.lab = 1.45, cex.axis = 1.45)
boxPlot(china$child_care, fact = china$edu, ylab = "Child care hours", col = fadeColor(COL[1], 66), xlim=c(0.6, 5.4))

dev.off()

###


xtable(anova(lm(china$child_care ~ china$edu)))

summary(lm(china$child_care ~ china$edu))