library(openintro)
data(email)
data(COL)

tab <- table(email[,c('spam', 'number')])[2:1,]
row.names(tab) <- c("spam", "not spam")
tab <- t(tab)

rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("emailSpamNumberSegBar.pdf", 4.5, 3.5, mar=c(2, 3, 0.5, 0.5), mgp=c(2.2, 0.6, 0))
barplot(apply(tab, 1, sum), col=COL[3])
tabTemp <- tab[,1]
names(tabTemp) <- NULL
barplot(tabTemp, col=COL[1], add=TRUE, axes=FALSE)
abline(h=0)
legend("topright", fill=COL[c(3,1)], legend=c("not spam", "spam"))
dev.off()

myPDF("emailSpamNumberSegBarSta.pdf", 4.5, 3.5, mar=c(2, 2.5, 0.5, 0.5), mgp=c(2.2, 0.6, 0))
barplot(apply(tab, 1, sum)/apply(tab, 1, sum), col=COL[3])
tabTemp <- rp[,1]
names(tabTemp) <- NULL
barplot(tabTemp, col=COL[1], add=TRUE, axes=FALSE)
abline(h=0)
dev.off()

