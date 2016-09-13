library(openintro)
data(email)
tab <- table(email[,c('spam', 'number')])
row.names(tab) <- c("not spam", "spam")
tab  <- t(tab)
ttab <- t(tab)

rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("emailNumberMosaic.pdf", 3.5*0.75, 3*0.75, mar=c(1,1,1,1)/4)
mosaicplot(rowSums(tab), main='', xlab='', ylab='', off=4, col=COL[c(2,1,4)])
dev.off()
colnames(tab)[1] <- "not\nspam"

myPDF("emailSpamNumberMosaic.pdf", 4*0.75, 3*0.75, mar=rep(1,4)/4)
mosaicplot(tab, main='', xlab='', ylab='', col=COL[c(1,2)])
dev.off()

myPDF("emailSpamNumberMosaicRev.pdf", 4*0.75, 3*0.75, mar=rep(1,4)/4)
mosaicplot(ttab, main='', xlab='', ylab='', col=COL[c(2,1,4)])
dev.off()

