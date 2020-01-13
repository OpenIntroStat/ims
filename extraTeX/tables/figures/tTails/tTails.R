library(openintro)
data(COL)

myPDF("tTails.pdf", 6, 1.6,
      mfrow = c(1, 3),
      mar = c(3.3, 0.5, 0.5, 0.5))
normTail(L = -1.2, df = 8, col = COL[1])
mtext("One Tail", 1, line = 2.1, cex = 0.75)
normTail(U = 1.2, df = 8, col = COL[1])
mtext("One Tail", 1, line = 2.1, cex = 0.75)
normTail(L = -1.2, U = 1.2, df = 8, col = COL[1])
mtext("Two Tails", 1, line = 2.1, cex = 0.75)
dev.off()
