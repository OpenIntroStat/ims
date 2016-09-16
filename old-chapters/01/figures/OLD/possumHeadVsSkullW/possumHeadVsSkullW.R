library(openintro)
library(Cairo)

data(possum)
COL <- c('#550000AA','#556699AA')

CairoPDF("possumHeadVsSkullW.pdf", 1.1*4.95, 1.1*3)
par(mar=c(3.2,3.4,0.15,0.5), mgp=c(2.3,0.7,0), las=1, tcl=-0.3)

plot(possum$headL, possum$skullW, pch=20, col=c(COL[1], rep(COL[2], length(possum$headL)-1)), xlab='', ylab='skull width (mm)')
mtext("head length (mm)", 1, 2.1)

lines(c(94.1,94.1), c(0,60.4), lty=2, col=COL[1])
lines(c(0,94.1), c(60.4,60.4), lty=2, col=COL[1])

#text(94.1, 51, 94.1, col=COL[1], pos=4)

dev.off()