#install.packages("maps")
library(maps)
countyMap <- function(values, FIPS, col=c("red", "green", "blue"), varTrans=I, gtlt="", ...){
  if(missing(FIPS)){
    stop("Must provide the county FIPS")
  }
  
  #===> Drop NAs <===#
  FIPS   <- FIPS[!is.na(values)]
  values <- values[!is.na(values)]
  
  #===> Scale Values <===#
  MI  <- min(values)
  MA  <- max(values)
  Leg <- seq(MI, MA, length.out=50)
  if(identical(varTrans, log)){
    VAL    <- varTrans(values+0.1)
    valCol <- varTrans(values+0.1)
    LegCol <- varTrans(Leg+0.1)
  } else {
    VAL    <- varTrans(values)
    valCol <- varTrans(values)
    LegCol <- varTrans(Leg)
  }
  valCol <- 0.98*(valCol - MI)/(MA - MI) + 0.01
  LegCol <- 0.98*(LegCol - MI)/(MA - MI) + 0.01
  
  val.04 <- 0.4*(1 - valCol)
  val.06 <- 0.6*(1 - valCol)
  val.07 <- 0.7*(1 - valCol)
  val.08 <- 0.8*(1 - valCol)
  val.10 <- 1.0*(1 - valCol)
  
  Leg.04 <- 0.4*(1 - LegCol)
  Leg.06 <- 0.6*(1 - LegCol)
  Leg.07 <- 0.7*(1 - LegCol)
  Leg.08 <- 0.8*(1 - LegCol)
  Leg.10 <- 1.0*(1 - LegCol)
  
  if(col[1] == "red"){
    col <- rgb(val.10, val.07, val.07)
    COL <- rgb(Leg.10, Leg.07, Leg.07)
  } else if(col[1] == "green"){
    col <- rgb(val.07, val.10, val.07)
    COL <- rgb(Leg.07, Leg.10, Leg.07)
  } else if(col[1] == "bg"){
    col <- rgb(val.06, val.08, val.10)
    COL <- rgb(Leg.06, Leg.08, Leg.10)
  } else if(col[1] == "ye"){
    col <- rgb(val.10, val.10, val.04)
    COL <- rgb(Leg.10, Leg.10, Leg.04)
  } else {
    col <- rgb(val.06, val.06, val.10)
    COL <- rgb(Leg.06, Leg.06, Leg.10)
  }
  
  #===> Remove These <===#
  data(county.fips)
  col <- col[match(county.fips$fips, FIPS)]
  plot(0,0,type="n", axes=FALSE, xlab="", ylab="")
  par(mar=rep(0.1,4), usr=c(-0.385,0.41,0.44,0.91))
  map("county", col=col, fill=TRUE, resolution=0,
    lty=0, projection="polyconic", mar=rep(0.1,4), add=TRUE, ...)
  
  x1 <- 0.335
  x2 <- 0.365
  for(i in 1:50){
    y1 <- i/50 * 0.25 + 0.5
    y2 <- (i-1)/50 * 0.25 + 0.5
    rect(x1, y1, x2, y2, border="#00000000", col=COL[i])
  }
  
  VR    <- range(VAL)
  VR[3] <- VR[2]
  VR[2] <- mean(VR[c(1,3)])
  
  VR1    <- c()
  VR1[1] <- values[which.min(abs(VAL - VR[1]))]
  VR1[2] <- values[which.min(abs(VAL - VR[2]))]
  VR1[2] <- values[which.min(abs(VAL - VR[3]))]
  
  VR    <- round(VR)
  if(gtlt %in% c(">", "><")){
    VR[3] <- paste(">", VR[3], sep="")
  }
  if(gtlt %in% c("<", "><")){
    VR[1] <- paste("<", VR[1], sep="")
  }
  text(0.365, 0.51, VR[1], pos=4)
  text(0.365, 0.625, VR[2], pos=4)
  text(0.365, 0.74, VR[3], pos=4)
}





