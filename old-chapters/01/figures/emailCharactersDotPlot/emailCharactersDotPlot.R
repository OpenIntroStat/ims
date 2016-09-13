library(openintro)
data(email50)
data(COL)


dotPlotStack <- function(x, center, radius=1, seed=1, addDots=TRUE, ...){
  set.seed(seed)
  x <- sample(d)
  y <- rep(NA, length(x))
  y[1] <- 1
  for(i in 2:length(x)){
    add <- TRUE
    for(s in seq(radius, i*radius, radius/20)){
      these <- 1:(i-1)
      dx    <- (x[i] - x[these])^2
      dy    <- (s - y[these])^2
      if(any(dx+dy < radius^2) || !add){
        next
      } else {
        if(addDots){
          points(x[i], s, ...)
        }
        y[i] <- s
        add  <- FALSE
      }
    }
  }
  invisible(list(max(y)+radius, x))
}
# Quick thought for improved version...
# Write an optimization algorithm that swaps the
# order of two observations in the vector when moving
# one would result in an improved "settling".


myPDF("emailCharactersDotPlot.pdf", 7.5, 1.25, mar=c(3.6,1,0,1), las=1, mgp=c(2.5,0.7,0), tcl=-0.4)
d <- email50$num_char
dotPlot(d, xlab='Number of Characters (in thousands)', ylab='', pch=20, col=COL[1,2], cex=1.5, ylim=c(0.95,1.05), axes=FALSE)
axis(1, at=seq(0, 70, 10))
M <- mean(d)
polygon(M + c(-2,2,0)*1.5, c(0.95, 0.95, 0.98), border=COL[4], col=COL[4])

dev.off()

set.seed(10)
myPDF("emailCharactersDotPlotStacked.pdf", 5, 2.7, mar=c(3.6,1,0.5,1), las=1, mgp=c(2.5,0.7,0))
N      <- 35
#stacks <- table(cut(d, seq(0,max(d)+5, length.out=N)))
#edges  <- seq(0,max(d)+5, length.out=N)
radius  <- 1.8
cex     <- 1.5
seed    <- 3
stacks  <- dotPlotStack(x, radius=radius, addDots=FALSE, pch=19, col=COL[1], cex=1.25, seed=seed)
plot(0, type="n", xlab="Number of Characters (in thousands)", axes=FALSE, ylab="", xlim=c(0, 75), ylim=c(-1, max(stacks[[1]])))

dotPlotStack(x, radius=radius, pch=19, col=COL[1], cex=cex, seed=seed)

#for(i in 1:length(stacks)){
#  if(stacks[i] > 0){
#    decreasing <- i %% 2 == 0
#    x <- sort(d[d > edges[i] & d < edges[i+1]])
#    points(x, 1:stacks[i], pch=19, col=COL[1], cex=1.25)
#  }
#}
abline(h=0)
axis(1, at=seq(0, 70, 10))
polygon(M + c(-1.7,1.7,0)*2.5, c(-1.7, -1.7, -0.1), border=COL[4], col=COL[4])

#points(1:20, 1:20/10)

dev.off()


M
sd(d)




#table(cut(d, seq(0,60, 5)))
#hist(d, 12)