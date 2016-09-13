library(openintro)
data(COL)
set.seed(3)
N   <- 108
n   <- 18
colSamp <- COL[4]
PCH <- rep(c(1, 3, 20)[3], 3)

col <- rep(COL[1], N)
pch <- PCH[match(col, COL)]

myPDF("samplingMethodsFigure.pdf", 5.9, 9, mar=rep(0.5,4), mfrow=c(3,1))

#=====> SRS <=====#
plot(0, xlim=c(0,2), ylim=0:1, type='n', axes=FALSE)
box()
x   <- runif(N, 0, 2)
y   <- runif(N)
inc <- n
points(x, y, col=col, pch=pch)

these <- sample(N, n)
points(x[these], y[these], pch=20, cex=0.8, col=colSamp)
points(x[these], y[these], cex=1.4, col=colSamp)


#=====> Stratified <=====#
PCH <- rep(c(1, 3, 20)[3], 3)
plot(0, xlim=c(0,2), ylim=0:1, type='n', axes=FALSE)
box()
X    <- c(0.18, 0.3, 0.68, 1.18, 1.4, 1.74)
Y    <- c(0.2, 0.78, 0.44, 0.7, 0.25, 0.65)
locs <- c(1, 4, 5, 3, 6, 2)
gps  <- list()
N    <- 1.1*c(15, 12, 35, 22, 13, 28)
R    <- sqrt(N/500)
p    <- matrix(c(12, 2, NA,
				 1,  2, NA,
				 4,  30, NA,
				 19, 1, NA,
				 11, 0, NA,
				 3, 24, NA), 3)
p     <- round(p*1.1)
p[3,] <- N - p[1,] - p[2,]
above <- c(1, 1, 1, 1, -1, 1)
for(i in 1:6){
	hold <- seq(0, 2*pi, len=99)
	x    <- X[i] + (R[i]+0.01)*cos(hold)
	y    <- Y[i] + (R[i]+0.01)*sin(hold)
	polygon(x, y, border=COL[5,4])
	x    <- rep(NA, N[i])
	y    <- rep(NA, N[i])
	for(j in 1:N[i]){
		inside <- FALSE
		while(!inside){
			xx <- runif(1, -R[i], R[i])
			yy <- runif(1, -R[i], R[i])
			if(sqrt(xx^2 + yy^2) < R[i]){
				inside <- TRUE
				x[j]   <- xx
				y[j]   <- yy
			}
		}
	}
	type <- sample(1, N[i], TRUE)
	pch  <- PCH[type]
	col  <- COL[type]
	x    <- X[i]+x
	y    <- Y[i]+y
	points(x, y, pch=pch, col=col)
	these  <- sample(N[i], 3)
	points(x[these], y[these], pch=20, cex=0.8, col=colSamp)
	points(x[these], y[these], cex=1.4, col=colSamp)
}
text(X, Y+above*(R+0.01), paste("Stratum", 1:6), pos=2+above, cex=1.1)

#=====> Cluster <=====#
PCH <- rep(c(1, 3, 20)[3], 3)
plot(0, xlim=c(0,2), ylim=0:1, type='n', axes=FALSE)
box()
X    <- c(0.17, 0.19, 0.52, 0.85, 1, 1.22, 1.49, 1.79, 1.85)
Y    <- c(0.3, 0.75, 0.5, 0.26, 0.73, 0.38, 0.67, 0.3, 0.8)
locs <- c(1, 4, 5, 3, 6, 2)
gps  <- list()
N    <- c(18, 12, 11, 13, 16, 14, 15, 16, 12)
R    <- sqrt(N/500)
p    <- matrix(c(6,  8, NA,
				 4,  4, NA,
				 4,  4, NA,
				 5,  4, NA,
				 8,  5, NA,
				 4,  5, NA,
				 5,  9, NA,
				 6,  5, NA,
				 4,  5, NA), 3)
p[3,] <- N - p[1,] - p[2,]
above <- c(-1, 1, 1, 1, 1, -1, 1, 1, 1)
for(i in 1:length(X)){
	hold <- seq(0, 2*pi, len=99)
	x    <- X[i] + (R[i]+0.02)*cos(hold)
	y    <- Y[i] + (R[i]+0.02)*sin(hold)
	polygon(x, y, border=COL[5,4])
	if(i %in% c(3, 4, 8)){
		polygon(x, y, border=COL[4], lty=2, lwd=1.5)
	}
	x    <- rep(NA, N[i])
	y    <- rep(NA, N[i])
	for(j in 1:N[i]){
		inside <- FALSE
		while(!inside){
			xx <- runif(1, -R[i], R[i])
			yy <- runif(1, -R[i], R[i])
			if(sqrt(xx^2 + yy^2) < R[i]){
				inside <- TRUE
				x[j]   <- xx
				y[j]   <- yy
			}
		}
	}
	type <- sample(1, N[i], TRUE)
	pch  <- PCH[type]
	col  <- COL[type]
	x    <- X[i]+x
	y    <- Y[i]+y
	points(x, y, pch=pch, col=col)
	these  <- 1:N[i]
	if(i %in% c(3, 4, 8)){
	points(x[these], y[these], pch=20, cex=0.8, col=colSamp)
	points(x[these], y[these], cex=1.4, col=colSamp)
		#points(x[these], y[these], pch=19, col=colSamp)
	}
}
text(X, Y+above*(R+0.01), paste("Cluster", 1:length(X)), pos=2+above, cex=1.1)

dev.off()