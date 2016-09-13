
d <- read.delim('file:///Volumes/PONTOOF/book/dataMgmt/fdic/fdic.txt', T, sep=',')
adultM <- which(d$sex == 0 & d$age > 19 & d$age < 63)
ds <- d[adultM,]
ds <- ds[!is.na(ds$height1),]
ds <- ds[!is.na(ds$samplingWeight),]

n <- 100
tsw  <- sum(ds$samplingWeight)
samp <- runif(n)*tsw
height <- rep(NA, n)
cumSum <- ds$height1[1]

for(i in 2:length(ds$height1)){
	cumSum[i] <- cumSum[i-1]+ds$samplingWeight[i]
}

samp <- runif(n)*tsw
height <- rep(NA, n)
for(i in 1:n){
	S <- 0
	temp <- which(cumSum <= samp[i])
	height[i] <- ds$height1[rev(temp)[1]]
}

par(mfrow=1:2)
hist(height)
qqnorm(height)
shapiro.test(height)

for(i in 1:length(height)) cat(height[i], ', ', sep='')
