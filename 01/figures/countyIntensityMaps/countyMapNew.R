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
  
  val.000 <- 0.500*(1-valCol)
  val.114 <- 0.557*(1-valCol)
  val.200 <- 0.600*(1-valCol)
  val.298 <- 0.649*(1-valCol)
  val.318 <- 0.659*(1-valCol)
  val.337 <- 0.669*(1-valCol)
  val.447 <- 0.724*(1-valCol)
  val.608 <- 0.804*(1-valCol)
  val.741 <- 0.871*(1-valCol)
  val.863 <- 0.932*(1-valCol)
  val.941 <- 0.971*(1-valCol)
  val.957 <- 0.979*(1-valCol)
  
  Leg.000 <- 0.500*(1-LegCol)
  Leg.114 <- 0.557*(1-LegCol)
  Leg.200 <- 0.600*(1-LegCol)
  Leg.298 <- 0.649*(1-LegCol)
  Leg.318 <- 0.659*(1-LegCol)
  Leg.337 <- 0.669*(1-LegCol)
  Leg.447 <- 0.724*(1-LegCol)
  Leg.608 <- 0.804*(1-LegCol)
  Leg.741 <- 0.871*(1-LegCol)
  Leg.863 <- 0.932*(1-LegCol)
  Leg.941 <- 0.971*(1-LegCol)
  Leg.957 <- 0.979*(1-LegCol)
  
  if(col[1] == "red"){
    col <- rgb(val.941, val.318, val.200)
    COL <- rgb(Leg.941, Leg.318, Leg.200)
  } else if(col[1] == "green"){
    col <- rgb(val.298, val.447, val.114)
    COL <- rgb(Leg.298, Leg.447, Leg.114)
  } else if(col[1] == "bg"){
    col <- rgb(val.337, val.608, val.741)
    COL <- rgb(Leg.337, Leg.608, Leg.741)
  } else if(col[1] == "ye"){
    col <- rgb(val.957, val.863, val.000)
    COL <- rgb(Leg.957, Leg.863, Leg.000)
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





