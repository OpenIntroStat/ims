library(openintro)
data(COL)
d = read.table("Students_Survey_2008.txt", h = T, sep = "\t")

d = d[!is.na(d$speed) & !is.na(d$height) & !is.na(d$gender),]

d$col = NULL
d$col[d$gender == "female"] = COL[4]
d$col[d$gender == "male"] = COL[2]

d$pch = NULL
d$pch[d$gender == "female"] = 4
d$pch[d$gender == "male"] = 19

###

pdf("speed_height.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(d$speed ~ d$height, xlab='Height (in inches)', ylab='Fastest speed (in mph)', pch=19, col=fadeColor(COL[1],80), axes = FALSE, ylim = c(0,150))
axis(1, at = seq(60,75,5))
axis(2, at = seq(0,150,50))
box()

dev.off()

###

pdf("speed_height_gender.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.7,0.55,0), cex.lab = 1.25, cex.axis = 1.25, tcl=-0.3)

plot(d$speed ~ d$height, xlab='Height (in inches)', ylab='Fastest speed (in mph)', pch=d$pch, col=fadeColor(d$col,80), axes = FALSE, ylim = c(0,150))
axis(1, at = seq(40,80,10))
axis(2, at = seq(0,150,50))
box()
legend("bottomright", inset = 0.05, col = c(COL[4],COL[2]), pch=c(4,19), c("female", "male"))

dev.off()