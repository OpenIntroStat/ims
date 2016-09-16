setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/durhamAQI")

oiB = "#3E9BC0"
oiG = "#4C721D"

d = read.csv("pm25_2011_durham.csv")

d = d[d$DAILY_AQI_VALUE != ".",]

d$DAILY_AQI_VALUE = as.numeric(as.character(d$DAILY_AQI_VALUE))

###

pdf("durhamAQI_hist.pdf", 8, 4)
par(mar=c(4,3,0.5,0.5), las=1, mgp=c(2.7,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

hist(d$DAILY_AQI_VALUE, col=oiB, xlab = "daily AQI value", main = "", axes = FALSE, probability = TRUE, ylab = "")
axis(1)
axis(2, at = seq(0,0.04,0.01), labels = seq(0,0.04,0.01)*5)
abline(h = seq(0.01,0.04,0.01), col = "gray", lty = 2)

dev.off()

###

hs = hist(d$DAILY_AQI_VALUE, col=oiB, xlab = "daily AQI value", main = "", axes = FALSE, probability = TRUE, ylab = "Relative frequency")
text_x = (hs$breaks - 2.5)[2:13]
text_y = hs$intensities + 0.002
text_text = round(hs$counts / length(d$DAILY_AQI_VALUE), 2)

pdf("durhamAQI_histSoln.pdf", 8, 4)
par(mar=c(4,3,0.5,0.5), las=1, mgp=c(2.7,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

hist(d$DAILY_AQI_VALUE, col=oiB, xlab = "daily AQI value", main = "", axes = FALSE, probability = TRUE, ylab = "", ylim = c(0, max(hs$intensities) + 0.002))
axis(1)
axis(2, at = seq(0,0.04,0.01), labels = seq(0,0.04,0.01)*5)
abline(h = seq(0.01,0.04,0.01), col = "gray", lty = 2)
text(x = text_x, y = text_y, labels = as.character(text_text), col = oiG, cex = 1.25)

dev.off()
