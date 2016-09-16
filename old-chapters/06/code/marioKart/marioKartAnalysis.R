library(xtable)
library(openintro)
data(marioKart)
toss      <- which(marioKart$totalPr > 80)
keep      <- c("totalPr", "cond", "stockPhoto", "duration", "wheels", "shipSp")
d         <- marioKart[-toss, keep]
d$stockPhoto <- (d$stockPhoto == "yes") + 0
d$cond    <- (d$cond == "new") + 0
thisOne   <- names(d) == "cond"
names(d)[thisOne] <- "condNew"
d$shipSp  <- as.character(d$shipSp)
these     <- d$shipSp %in% c("firstClass", "priority", "parcel", "media")
d$shipSp[these] <- "usps"
these     <- d$shipSp %in% c("ups3Day", "upsGround")
d$shipSp[these] <- "ups"
these     <- d$shipSp %in% c("other", "standard")
d$shipSp[these] <- "unknown"
d$shipSp  <- as.factor(d$shipSp)
d         <- d[,-which(colnames(d) == "shipSp")]

summary(lm(totalPr ~ ., d))
summary(lm(totalPr ~ condNew + stockPhoto + duration + wheels, d))
xtable(summary(lm(totalPr ~ condNew + stockPhoto + wheels, d)))
xtable(summary(fit <- lm(totalPr ~ condNew + wheels, d)))


fit1 <- lm(totalPr ~ duration + cond + stockPhoto + wheels, d)
fit2 <- lm(totalPr ~ cond + stockPhoto + wheels, d)
anova(fit1, fit2)

fit1 <- lm(totalPr ~ cond + stockPhoto, d)
fit2 <- lm(totalPr ~ stockPhoto, d)
anova(fit1, fit2)
