library(openintro)
data(oscars)

oiB = "#3E9BC0"

###

pdf("oscars_hist.pdf", height = 6, width = 8)

par(mar=c(3.7,2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(2,1), cex.lab = 1.25, cex.axis = 1.25)

histPlot(oscars$age[oscars$gender == "female"], ylab = "", xlab = "", col = oiB, xlim = c(20,80), breaks = 12, axes = FALSE)
axis(1, at = seq(20,80,20))
axis(2, at = seq(0,20,10))
text(x = 60, y = 18, labels = "Best actress", pos = 4, cex = 1.25)

histPlot(oscars$age[oscars$gender == "male"], ylab = "", xlab = "Ages (in years)", col = oiB, xlim = c(20,80), breaks = 12, axes = FALSE)
axis(1, at = seq(20,80,20))
axis(2, at = seq(0,20,10))
text(x = 60, y = 18, labels = "Best actor", pos = 4, cex = 1.25)

dev.off()

###

mean(cle, na.rm = TRUE)
sd(cle, na.rm = TRUE)
length(cle)


mean(sac, na.rm = TRUE)
sd(sac, na.rm = TRUE)
length(sac)