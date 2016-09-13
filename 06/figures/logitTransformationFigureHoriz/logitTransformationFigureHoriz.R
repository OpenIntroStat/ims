library(openintro)
data(COL)
p  <- seq(0.0001, 0.9999, 0.0002)
lp <- log(p/(1-p))

pts  <- seq(0.01, 0.99, length.out=25)
R    <- c(-6,6)
adj  <- 0.07
adj1 <- 0.02


myPDF("logitTransformationFigureHoriz.pdf", 7, 4, mar=c(3.3, 3.4, 0.8, 0.8), mgp=c(2.1, 0.55, 0))
# layout(matrix(1:2, 1), c(1,1.5))


plot(lp, p, ylab="", xlab=expression(logit(p[i])), xlim=c(-5.8, 6.5), ylim=c(-0.05, 1.1), type="n")
lines(lp, p, type="l", col=COL[5], lwd=1.5)
mtext(expression(p[i]), 2, 2.4)
abline(h=0:1, lty=2, col=COL[1], lwd=1.5)
this <- which.min(abs(p-0.2))
#lines(rep(p[this], 2), c(-50, lp[this]), col="#00000044")#, lty=3, lwd=2)
#lines(c(-1, p[this]), rep(lp[this], 2), col="#00000044")#, lty=3, lwd=2)
LP    <- c(seq(6, -5, -1)) #log(P/(1-P))
P     <- exp(LP)/(1+exp(LP))#1-c(0.01, 0.05, 0.1, 0.20, 0.3, 0.4, 0.5)
POS   <- c(3, 1, 3, 1, 2, 2, 2, 2, 4, 3, 1, 3)
xOFF  <- c()
Round <- c(3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 3, 3)
for(i in 1:length(LP)){
  points(LP[i], P[i], col=COL[4], lwd=2)
  t1   <- format(round(c(LP,0.9), Round[i]))[i]
  t2   <- format(round(P, Round[i]))[i]
  temp <- paste("(", t1, ", ", t2, ")", sep="")
  text(LP[i], P[i], temp, cex=0.6, pos=POS[i], col=COL[5])
  
}
#points(lp[this], p[this])
#text(lp[this], p[this], "(-1.39, 0.20)", cex=0.7, pos=4)




# plot(R, c(-0.4, 2.4), type="n", xlab="", ylab="", axes=FALSE)

# lines(0:1, c(2,2))
# segments(0:1, 2-adj, 0:1, 2+adj)
# text(0:1, 2+adj1, 0:1,pos=3)
# text(0.5, 2.1, expression(p[i]), pos=3)

# #arrows(0, 1, R[2], 1, length=0.08)
# #segments(0:(R[2]-1), 1-adj, 0:(R[2]-1), 1+adj)
# pts1 <- pts/(1-pts)
# #segments(pts, 2, pts1, 1)

# arrows(R[1], 0, R[2], 0, length=0.08, code=3)
# segments((R[1]+1):(R[2]-1), -adj, (R[1]+1):(R[2]-1), adj)
# pts2 <- log(pts1)
# arrows(pts, 2, pts2, 0, length=0.05)
# text((R[1]+1):(R[2]-1), rep(-adj1, R[2]-R[1]-2), (R[1]+1):(R[2]-1), pos=1, cex=0.8)

# text(-4, 1, expression(logit(p[i])))

# #abline(h=0:1)

dev.off()
