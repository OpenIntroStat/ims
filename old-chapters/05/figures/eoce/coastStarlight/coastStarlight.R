library(openintro)
data(COL)

cs = read.table("CoastStarlight.txt", h = T, sep = "\t")

###

myPDF("coastStarScat.pdf", 5.5, 4.3, mar=c(3.6,3.6,0.5,0.5), mgp=c(2.5,0.55,0))

#dist <- cs$dist_km/1.609
plot(cs$travel_time ~ cs$dist, xlab = "Distance (miles)", ylab = "Travel Time (minutes)", pch=20, col=COL[1], axes = FALSE)
axis(1, at = seq(0,400,100))
axis(2, at = seq(0,360,60))
box()

dev.off()

###