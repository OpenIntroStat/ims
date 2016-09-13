setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/county")

#library(openintro)
#data(countyComplete)

# income bachelor scatter

load("/Users/mine/Dropbox/oistatistics/package/openintro/data/countyComplete.rda")

pdf("county_incomeBach.pdf", 5.5, 4.3)
par(mar=c(3.8,3.8,1,1), las=1, mgp=c(2.5,0.7,0))

plot(countyComplete$per_capita_income/1000 ~ countyComplete$bachelors, xlab="Percent with Bachelor's degree", ylab="Per capita income (in thousands)", pch=20, col="#22558866", cex.lab = 1.5, cex.axis = 1.5)

dev.off()

# hispanic map

source("~/Dropbox/oiStatistics/01/figures/countyIntensityMaps/eoce/countyMap.R", chdir = TRUE)

myPDF("county_hispMap.pdf", 7.8, 4.5)
val <- countyComplete$hispanic
val[val >= 40] <- 40
countyMap(val, countyComplete$FIPS, "bg", gtlt=">")
dev.off()

# hispanic hist

pdf("county_hispHist.pdf", 6, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(countyComplete$hispanic, xlab = "% Hispanic", ylab = "", border = '#225588', col = fadeColor('#225588', '33'), axes = TRUE)

dev.off()

# hispanic hist log

pdf("county_hispHistLog.pdf", 6, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(log(countyComplete$hispanic), xlab = "% Hispanic", ylab = "", border = '#225588', col = fadeColor('#225588', '33'), axes = TRUE)
dev.off()

# work travel hist

pdf("county_workTravelHist.pdf", 6, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(countyComplete$mean_work_travel, xlab = "Mean work travel (in min)", ylab = "", border = '#225588', col = fadeColor('#225588', '33'), axes = TRUE)

dev.off()


# work travel map

myPDF("county_workTravelMap.pdf", 7.8, 4.5)
val <- countyComplete$mean_work_travel
val[val >= 33] <- 33
countyMap(val, countyComplete$FIPS, "gr", gtlt=">")
dev.off()
