library(openintro)
data(ncbirths)

oiB = "#3E9BC0"

# summary statistics
by(ncbirths$gained, ncbirths$mature, mean, na.rm = TRUE)
by(ncbirths$gained, ncbirths$mature, sd, na.rm = TRUE)

ny = length(ncbirths$gained[ncbirths$mature == "younger mom" & !is.na(ncbirths$gained)])
nm = length(ncbirths$gained[ncbirths$mature == "mature mom" & !is.na(ncbirths$gained)])

###
pdf("ncbirths_hist.pdf", height = 5, width = 10)

par(mar=c(3.5,2.5,0.5,0.5), mgp=c(2.4,0.7,0), mfrow = c(2,1), cex.axis = 1.25, cex.lab = 1.25)

histPlot(ncbirths$gained[ncbirths$mature == "younger mom"], col = oiB, xlim = c(0,90), axes = FALSE, ylab = "", xlab = "")
axis(1, at = seq(0,80,20))
axis(2, at = seq(0,250,125), las = 2)
text(x = 60, y = 200, "Younger mom", pos = 4, cex = 1.25)

histPlot(ncbirths$gained[ncbirths$mature == "mature mom"], col = oiB, xlab = "Weight gain (in pounds)", xlim = c(0,90), axes = FALSE, ylab = "")
axis(1, at = seq(0,80,20))
axis(2, at = seq(0,40,20), las = 2)
text(x = 60, y = 30, "Mature mom", pos = 4, cex = 1.25)

dev.off()

###