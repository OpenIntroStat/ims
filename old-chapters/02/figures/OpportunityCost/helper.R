library(openintro)
data(COL)

DotPlotRegularized <- function(x,
                               width = 5,
                               col = "#569BBD",
                               cex = 1, ...) {
  x    <- sort(x)
  xu   <- unique(x)
  xlim <- range(x)
  X    <- table(x)
  height <- max(X) / width
  plot(0, 0, xlim = xlim, ylim = c(0, height),
       type = "n", axes = FALSE, ...)
  axis(1)
  
  spread <- min(diff(xu)) / width / 2
  for (i in seq_along(X)) {
    val     <- xu[i]
    num     <- X[i]
    num.rep <- round(num / width) + 1
    pos     <- rep(1:width, num.rep)
    rel.pos <- (pos[1:num] - width / 2) * spread
    ver.pos <- rep(1:num.rep, rep(width, num.rep))
    ver.pos <- ver.pos[1:num]
    points(val + rel.pos, ver.pos, pch = ".",
           col = col, cex = cex)
  }
  abline(h = 0)
}
