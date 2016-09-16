library(openintro)
data(countyComplete)

#library(openintro)
#data(countyComplete)

oiB =  "#3E9BC0"

# income bachelor scatter

pdf("county_incomeBach.pdf", 5.5, 4.3)
par(mar=c(3.8,3.8,1,1), las=1, mgp=c(2.5,0.7,0), cex.axis = 1.5)

plot(countyComplete$per_capita_income/1000 ~ countyComplete$bachelors, xlab="Percent with Bachelor's degree", ylab="Per capita income (in thousands)", pch=20, col=fadeColor("#3E9BC0",66), cex.lab = 1.5, axes = FALSE)
axis(1, at = seq(10,70,20))
axis(2)
box()

dev.off()

# hispanic map

source("countyMap.R", chdir = TRUE)

myPDF("county_hispMap.pdf", 7.8, 4.5)
val <- countyComplete$hispanic
val[val >= 40] <- 40
countyMap(val, countyComplete$FIPS, "bg", gtlt=">")
dev.off()

# hispanic hist

pdf("county_hispHist.pdf", 6, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(countyComplete$hispanic, breaks=25, xlab = "% Hispanic", ylab = "", col = oiB, axes = TRUE)

dev.off()

# hispanic hist log

pdf("county_hispHistLog.pdf", 6, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(log(countyComplete$hispanic), breaks=25, xlab = "% Hispanic", ylab = "", col = oiB, axes = TRUE)
dev.off()

# work travel hist

pdf("county_workTravelHist.pdf", 7.5, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

histPlot(countyComplete$mean_work_travel, breaks=40, xlab = "Mean work travel (in min)", ylab = "", col = oiB, axes=FALSE)
axis(1)
axis(2, at=seq(0, 200, 100))

dev.off()


# work travel map

myPDF("county_workTravelMap.pdf", 7.8, 4.5)
val <- countyComplete$mean_work_travel
val[val >= 33] <- 33
countyMap(val, countyComplete$FIPS, "gr", gtlt=">")
dev.off()
