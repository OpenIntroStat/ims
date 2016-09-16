setwd("~/Desktop/Open Intro/EOCE - Second Edition/07/figures/eoce/helmet")


# data

lunch = c(50,11,2,19,26,73,81,51,11,2,19,25)
helmet = c(22.1, 35.9, 57.9, 22.2, 42.4, 5.8, 3.6, 21.4, 55.2, 33.3, 32.4, 38.4)


pdf("lunch_helmet.pdf", 5.5, 4.3)

par(mar=c(4,4,0.5,0.5), las=1, mgp=c(2.8,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(x = lunch, y = helmet, ylab="% wearing helmets", xlab="% receiving reduced-fee lunch", pch=19, col=COL[1])

dev.off()


# model

summary(lm(helmet ~ lunch))