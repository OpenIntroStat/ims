library(openintro)
data(mammals)

myPDF("scatterMammalGestLSReg.pdf", 4, 3, mgp=c(2.2, 0.6, 0), mar=c(3.3, 3.3, 0.5, 0.5))
plot(mammals$Gestation, mammals$LifeSpan, main="", xlab="Gestation (days)", ylab="Lifespan (years)", col="#22558866", pch=19, axes=FALSE)
axis(1, seq(0, 600, 200))
axis(2, seq(0, 100, 50))
box()
dev.off()

myPDF("scatterMammalGestLSTra.pdf", 4, 3, mgp=c(2.2, 0.6, 0), mar=c(3.3, 3.3, 0.5, 0.5))
plot(log(mammals$Gestation), log(mammals$LifeSpan), main="", xlab="log(Gestation)", ylab="log(Lifespan)", col="#22558866", pch=19)
dev.off()