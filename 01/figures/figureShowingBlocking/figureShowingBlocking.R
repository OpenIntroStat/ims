library(openintro)
set.seed(2)
xlim     <- c(0, 1)
slimBox3 <- 0.03
COL      <- c("#225588", "#2266AA", "#882255", "#AA2266", "#000000", "#AAAAAA")
data(COL)

myPDF("figureShowingBlocking.pdf", 4, 7, mar=rep(0, 4))
plot(c(0, 2.9), type="n", axes=FALSE, xlab="", ylab="", xlim=c(-0.1, 1.1))
rect(0, 2.2, 1, 2.9)
text(0.5, 2.885, "Numbered patients", pos=3, cex=0.9)
rect(0, 1.2, 0.45, 1.9)
rect(0.55, 1.2, 1, 1.9)
arrows(0.56, 2.17, 0.75, 2.02, length=0.1, lwd=1.37)
arrows(0.44, 2.17, 0.25, 2.02, length=0.1, lwd=1.37)
text(0.5, 2.07, "create\nblocks", cex=0.8)
text(0.2, 1.89, "Low-risk patients", pos=3, cex=0.7)
text(0.2+0.55, 1.89, "High-risk patients", pos=3, cex=0.7)
rect(0, 0.48, 1, 0.9, border=COL[5])
rect(0, 0.00, 1, 0.42, border=COL[5])
#rect(0.55+slimBox3, 0.48, 1, 0.9)
#rect(0.55+slimBox3, 0.00, 1, 0.42)
arrows(0.09, 1.16, y1=1, length=0.1, lwd=1.37)
text(0.1, 1.08, "randomly\nsplit in half", cex=0.7, pos=4)
arrows(0.12+0.55, 1.16, y1=1, length=0.1, lwd=1.37)
text(0.13+0.55, 1.08, "randomly\nsplit in half", cex=0.7, pos=4)

#=====> Inner Box <=====#
rect(0.02, 0.50, 0.41, 0.88, border=COL[5,3])
rect(0.02, 0.02, 0.41, 0.40, border=COL[5,3])
rect(0.57+slimBox3, 0.50, 0.98, 0.88, border=COL[5,3])
rect(0.57+slimBox3, 0.02, 0.98, 0.40, border=COL[5,3])

#=====> Labels <=====#
rect(-0.05, 0.39+0.47, 0.14, 0.45+0.47, col="#FFFFFF", border=COL[5])
text(0.02, 0.424+0.47, "Control", cex=0.6, col=COL[5])

rect(-0.05, 0.39, 0.14, 0.45, col="#FFFFFF", border=COL[5])
text(0.04, 0.424, "Treatment", cex=0.6, col=COL[5])

n   <- 6*9
pch <- c(1, 20)[sample(2, n, TRUE, c(0.8, 1.2))]
cex <- rnorm(n, 1, 0.001)
k   <- 0
for(x in seq(0.1, 0.9, len=9)){
	for(y in rev(seq(0.3, 0.8, len=6))){
		k <- k+1
		points(x, y+2, pch=pch[k], cex=cex[k], col=COL[1+3*(pch[k]==1)])
		text(x, y+1.98, k, cex=0.45, pos=3, col=COL[1+3*(pch[k]==1)])
	}
}

trmt  <- rep(NA, n)

these <- which(pch == 1)
trmt[sample(these, length(these)/2)] <- "ctrl"
trmt[is.na(trmt) & pch == 1] <- "trmt"
k <- 0
x <- 0.078
y <- 1.83
for(i in these){
	k <- k+1
	points(x, y, pch=pch[i], cex=cex[i], col=COL[4])
	text(x, y-0.02, i, cex=0.45, pos=3, col=COL[4])
	if(y < 1.3){
		x <- x + 0.095
		y <- 1.83
	} else {
		y <- y - 0.11
	}
}
these <- which(pch != 1)
trmt[sample(these, length(these)/2)] <- "ctrl"
trmt[is.na(trmt) & pch != 1] <- "trmt"
k <- 0
x <- 0.615
y <- 1.82
for(i in these){
	k <- k+1
	points(x, y, pch=pch[i], cex=cex[i], col=COL[1])
	text(x, y-0.02, i, cex=0.45, pos=3, col=COL[1])
	if(y < 1.3){
		x <- x + 0.08
		y <- 1.83
	} else {
		y <- y - 0.095
	}
}

#=====> Low Risk <=====#
k <- rep(0,4)
x <- c(0.10, 0.10, 0.665, 0.665)
y <- c(0.35, 0.83, 0.35, 0.83)-0.03
for(i in 1:n){
	j <- 1
	if(trmt[i] == "trmt"){
		j <- j+1
	}
	if(pch[i] != 1){
		j <- j+2
	}
	k[j] <- k[j]+1
	points(x[j], y[j], pch=pch[i], cex=cex[i], col=COL[1+3*(pch[i] == 1)])
	text(x[j], y[j]-0.02, i, cex=0.45, pos=3, col=COL[1+3*(pch[i] == 1)])
	if(y[j] < 0.12 + 0.51*(j %in% c(2,4)) - 0.03){
		x[j] <- x[j] + 0.11 - 0.025*(j > 2)
		y[j] <- 0.35 + 0.48*(j %in% c(2,4)) - 0.03
	} else {
		y[j] <- y[j] - 0.085
	}
	#Sys.sleep(0.3)
}


























dev.off()