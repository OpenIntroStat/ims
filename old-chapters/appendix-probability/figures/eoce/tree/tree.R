setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/02/figures/eoce/tree")

# Box plot

pdf("tree_boxPlot.pdf", width = 6, height = 2.5)
treeDiag(c("\nCan construct\nbox plots?", "Passed?"), c(0.80, 0.20), list(c(0.86, 0.14), c(0.65, 0.35)), c("yes","no"), textwd=0.19, solwd=0.25, showWork=TRUE)

dev.off()


# Predisposition

pdf("tree_thrombosis.pdf", width = 6, height = 2.5)
treeDiag(c("Predisposition?", "Result"), c(0.03, 0.97), list(c(0.99, 0.01), c(0.02, 0.98)), c("yes","no"), c("positive","negative"), textwd=0.19, solwd=0.25, showWork=TRUE)
dev.off()


# SwazilandHIV

pdf("tree_swazilandHIV.pdf", width = 6, height = 2.5)
treeDiag(c("HIV?", "Result"), c(0.259, 1-0.259), list(c(0.997, 0.003), c(1-0.926, 0.926)), c("yes","no"), c("positive","negative"), textwd=0.19, solwd=0.25, showWork=TRUE)
dev.off()

# Scott Walker

pdf("tree_scott.pdf", width = 6, height = 3)
treeDiag(c("Support Walker", "College degree"), c(0.53, 0.47), p2=list(c(0.37, 0.63), c(0.44, 0.56)), cex.main=1.1)
dev.off()

# Lupus

pdf("tree_lupus.pdf", width = 6, height = 3)
treeDiag(c("Lupus?", "Result"), c(0.02, 0.98), list(c(0.98, 0.02), c(0.26, 0.74)), c("yes","no"), c("positive","negative"), textwd=0.19, solwd=0.25, showWork=TRUE)
dev.off()

# Twins

pdf("tree_twins.pdf", width = 10, height = 3.5)
treeDiag(main = c("Type of twins","Gender"), p1 = c(0.3, 0.7), p2 = list(c(0.5,0.5,0), c(0.25,0.25,0.5)), out1 = c("identical","fraternal"), out2 = c("males","females","male&female"), showWork = TRUE, textwd=0.19, solwd=0.25)
dev.off()

