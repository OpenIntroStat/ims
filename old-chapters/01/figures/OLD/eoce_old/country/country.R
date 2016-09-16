setwd("/Users/mine/Desktop/Open Intro/EOCE - Second Edition/01/figures/eoce/country")

library(openintro)
country = read.csv("country.csv", h = T)

# infant mortality

pdf("country_infMort.pdf", 6, 4)
par(mar=c(3.8,3.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

histPlot(country$inf_mort, xlab = "Infant Mortality Rate (per 1000 births)", ylab = "", border = '#225588', col = fadeColor('#225588', '33'), ylim = c(0,82.5), xlim = c(0,130), axes = FALSE)
axis(1, at=seq(0, 130, by = 20))
axis(2, at=seq(0, 82.5, by = 27.5), labels = as.character(seq(0, 82.5, by = 27.5)/nrow(country)))

dev.off()

# life exp vs. internet users

pdf("county_lifeExpInter.pdf", 5.5, 4.3)
par(mar=c(3.6,3.7,1,1), las=1, mgp=c(2.5,0.7,0))

plot(country$life_exp ~ country$internet, xlab="% Internet users", ylab="Life expectancy", pch=20, col="#225588", cex.lab = 1.5, cex.axis = 1.5)

dev.off()