library(stockPortfolio)
ticker <- c("^IXIC", "IBM")
gr <- getReturns(ticker, "day", start="2010-01-01", end="2010-11-01")
save(gr, file="SP500andIBM.rda")