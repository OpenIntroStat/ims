setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/exam")

exam = read.table("exam.txt", h = T, sep = "\t")

###

pdf("final_exam1.pdf", 5.5, 4.3)

par(mar=c(3.5,3.5,1,1), las=1, mgp=c(2.3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(exam$Course_grade ~ exam$Exam1, pch=19, col=fadeColor(COL[1],90), xlab = "Exam 1", ylab = "Final Exam", xlim = c(40,100), ylim = c(40,100), axes=FALSE)
axis(1, at = seq(40,100,20))
axis(2, at = seq(40,100,20))
box()

lmExam1 = lm(exam$Course_grade ~ exam$Exam1)
abline(lmExam1, col = COL[2], lwd = 2)

dev.off()

###

pdf("final_exam2.pdf", 5.5, 4.3)

par(mar=c(3.5,3.5,1,1), las=1, mgp=c(2.3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(exam$Course_grade ~ exam$Exam2, pch=19, col=fadeColor(COL[1],90), xlab = "Exam 2", ylab = "Final Exam", xlim = c(40,100), ylim = c(40,100), axes=FALSE)
axis(1, at = seq(40,100,20))
axis(2, at = seq(40,100,20))
box()


lmExam2 = lm(exam$Course_grade ~ exam$Exam2)
abline(lmExam2, col = COL[2], lwd = 2)

dev.off()