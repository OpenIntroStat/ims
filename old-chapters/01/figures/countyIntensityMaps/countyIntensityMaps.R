library(openintro)
data(countyComplete)
data(county)
data(COL)
source("countyMap.R")

myPDF("countyPovertyMap.pdf", 7.8, 4.5)
val <- county$poverty
val[val > 25] <- 25
countyMap(val, countyComplete$FIPS, "red", gtlt=">")
dev.off()

myPDF("countyFedSpendMap.pdf", 7.8, 4.5)
val <- county$fed_spend
val[val > 18] <- 18
countyMap(val, countyComplete$FIPS, "ye", gtlt=">")
dev.off()

myPDF("countyHomeownershipMap.pdf", 7.8, 4.5)
val <- county$homeownership
val[val < 55] <- 55
countyMap(val, countyComplete$FIPS, "bg", gtlt="<")
dev.off()

myPDF("countyMedIncomeMap.pdf", 7.8, 4.5)
val <- county$med_income/1000
val[val > 60] <- 60
countyMap(val, countyComplete$FIPS, "green", gtlt=">")
dev.off()
