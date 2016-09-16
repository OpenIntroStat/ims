setwd("~/Desktop/Open Intro/EOCE - Second Edition/08/figures/eoce/cherry")

cherry = read.csv("cherry.csv")

xtable(summary(lm(Volume ~ Height + Diam, data = cherry)), digits = 2)