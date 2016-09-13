myPDF("temp.pdf", 40, 40)
pairs(cc[sample(3000,100),1:25+25], pch=19, cex=1.5)
dev.off()

cc <- countyComplete

plot(cc$housing_multi_unit, cc$home_ownership)

