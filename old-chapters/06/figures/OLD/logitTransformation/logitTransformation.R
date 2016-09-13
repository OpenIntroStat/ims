library(openintro)
pts  <- seq(0.05, 0.95, 0.05)
R    <- c(-5,8)
adj  <- 0.07
adj1 <- 0.02

myPDF("logitTransformation.pdf", mar=c(0,0,0,0))
plot(R, c(-0.4, 2.4), type="n", xlab="", ylab="", axes=FALSE)

lines(0:1, c(2,2))
segments(0:1, 2-adj, 0:1, 2+adj)
text(0:1, 2+adj1, 0:1,pos=3)

arrows(0, 1, R[2], 1, length=0.08)
segments(0:(R[2]-1), 1-adj, 0:(R[2]-1), 1+adj)
pts1 <- pts/(1-pts)
segments(pts, 2, pts1, 1)

arrows(R[1], 0, R[2], 0, length=0.08, code=3)
segments((R[1]+1):(R[2]-1), -adj, (R[1]+1):(R[2]-1), adj)
pts2 <- log(pts1)
segments(pts1, 1, pts2, 0)
text((R[1]+1):(R[2]-1), rep(-adj1, R[2]-R[1]-2), (R[1]+1):(R[2]-1), pos=1, cex=0.8)

abline(h=0:1)

dev.off()
