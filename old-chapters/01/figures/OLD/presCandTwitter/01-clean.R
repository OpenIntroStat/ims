rm(list=ls())
library(openintro)
library(twitteR)
folder <- ""
files  <- list.files(folder)

load("01-02.rda")

#=====> Debt Ceiling Fight <=====#
event <- as.numeric(as.Date("2011-08-02", "%Y-%m-%d"))
sname <- c("BarackObama", "EricCantor", "SpeakerBoehner", "McConnellPress")
dates <- created[tweets$sn == sname[1]]
weeks <- event + (-26:26)*7
tw    <- matrix(NA, length(weeks)-1, length(sname))
for(s in 1:length(sname)){
  temp <- as.numeric(created[tweets$sn == sname[s]])
  for(w in 1:(length(weeks)-1)){
    tw[w,s] <- sum(weeks[w] < temp & temp <= weeks[w+1])
  }
}
weeks <- as.Date(weeks, origin="1970-01-01")
LWD   <- c(0.8, 1.2, 1.2, 1.6)
LTY   <- 1:4
COL   <- c(1,2,4,6)
myPDF("debtFight.pdf", 6, 3.5, call=2, mar=c(3.3, 3.9, 0.5, 0.5))
plot(weeks[-1], tw[,1], type="l", lty=LTY[1], col=COL[1], lwd=LWD[1], xlab="", ylab="Tweets per Week", ylim=c(0, 180))
mtext("Month", 1, 2)
lines(weeks[-1], tw[,3], lty=LTY[3], col=COL[3], lwd=LWD[3])
lines(weeks[-1], tw[,4], lty=LTY[4], col=COL[4], lwd=LWD[4])
abline(v=as.Date("2011-08-02", "%Y-%m-%d"), lty=3, lwd=2)
legend("topleft", col=COL[-2], lty=LTY[-2], lwd=LWD[-2], legend=sname[-2])
text(as.Date("2011-08-02", "%Y-%m-%d"), 170, "Debt Ceiling Deadline", pos=4, cex=0.8)
dev.off()

