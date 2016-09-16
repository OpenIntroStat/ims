
COL <- c('#550000AA','#55669955')

par(mar=c(3.5,3.5,1,1), mgp=c(2.3,0.7,0), las=1)

plot(possum$headL, possum$skullW, pch=20, col=c(COL[1], rep(COL[2], length(headL)-1)), xlab='head length (mm)', ylab='skull width (mm)')

lines(c(94.1,94.1), c(0,60.4), lty=2, col=COL[1])
lines(c(0,94.1), c(60.4,60.4), lty=2, col=COL[1])

#text(94.1, 51, 94.1, col=COL[1], pos=4)

