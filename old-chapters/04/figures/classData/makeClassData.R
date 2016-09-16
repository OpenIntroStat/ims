library(openintro)
set.seed(5)

mu <- c(78, 73, 76)
n  <- c(58, 55, 51)
s  <- 15
t1 <- rep(mu, n)
m1 <- round(rt(sum(n), 20)*s+t1)
m1[m1 > 100] <- 100 - rpois(sum(m1 > 100), 1)
lecture <- rep(letters[1:3], n)

boxPlot(m1, lecture)

classData <- data.frame(m1, lecture)
save(classData, file="classData.rda")

anova(lm(m1 ~ lecture))
summary(lm(m1 ~ lecture))

