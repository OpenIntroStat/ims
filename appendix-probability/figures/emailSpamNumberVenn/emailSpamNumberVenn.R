library(openintro)
data(COL)
data(email)

table(email[,c("spam", "number")])

table(email[,c("number")])

myPDF('emailSpamNumberVenn.pdf', 5, 1.5, mar=c(0.1,1.5,0.1,0.1))
plot(c(-0.2,2.2), c(0,1), type='n', ylab="", axes=FALSE)
box()

z <- seq(0,2*pi, len=99)
x1 <- cos(z)*1.04+0.8
y1 <- sin(z)/3+0.5
lines(c(x1, x1[1]),c(y1, y1[1]))

x2 <- cos(z)/2.2+1.8
y2 <- sin(z)/3+0.5
lines(c(x2, x2[1]),c(y2, y2[1]))

text(0.6, 0.9, 'small numbers and no big numbers')
text(1.9, 0.9, 'spam')
text(c(0.6, 1.56, 2), c(0.6, 0.58, 0.57), c(2659, 168, 199), cex=c(1.7,1.2,1.25))
text(c(0.6, 1.56, 2), c(0.4, 0.44, 0.43), c('0.678', '0.043', '0.051'), cex=c(1.3,0.95,1), col=COL[1])
text(0.77, 0.07, 'Other emails: 3921-2659-168-199 = 895')
text(1.84, 0.07, '(0.228)', col=COL[1])

dev.off()
table(email[,c("spam", "number")])
