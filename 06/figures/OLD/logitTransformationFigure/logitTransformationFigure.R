library(openintro)
p  <- seq(0.0001, 0.9999, 0.0002)
lp <- log(p/(1-p))

pts  <- seq(0.01, 0.99, length.out=25)
R    <- c(-6,6)
adj  <- 0.07
adj1 <- 0.02


myPDF("logitTransformationFigure.pdf", 4, 4.5, mar=c(3.3, 3.4, 0.8, 0.8), mgp=c(2.1, 0.55, 0))
# layout(matrix(1:2, 1), c(1,1.5))


plot(p, lp, xlab=expression(p[i]), ylab=expression(logit(p[i])), type="l", ylim=c(-4.5, 4.5), col="#225588")
abline(v=0:1, lty=2, col="#88000077")
this <- which.min(abs(p-0.2))
#lines(rep(p[this], 2), c(-50, lp[this]), col="#00000044")#, lty=3, lwd=2)
#lines(c(-1, p[this]), rep(lp[this], 2), col="#00000044")#, lty=3, lwd=2)
points(p[this], lp[this])
text(p[this]+0.1, lp[this], "(0.20, -1.39)", cex=0.7, pos=1)




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
