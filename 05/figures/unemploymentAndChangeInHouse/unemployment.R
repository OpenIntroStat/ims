# from
# http://en.wikipedia.org/wiki/User_talk:Peace01234
# 1940 onward: ftp://ftp.bls.gov/pub/special.requests/lf/aat1.txt
# Notes on "US Unemployment 1890-2009.gif" 1930-2009 data are from Bureau of Labor Statistics, Employment status of the civilian noninstitutional population, 1940 to date [1], retrieved March 9, 2009 and [2] retrieved February 12, 2010. See also "Historical Comparability" under the Household Data section of the Explanatory Notes athttp://www.bls.gov/cps/eetech_methods.pdf. 1890-1920 data are from Christina Romer (1986). "Spurious Volatility in Historical Unemployment Data", The Journal of Political Economy, 94(1): 1-37. 1920-1930 data are from Robert M. Coen (1973). "Labor Force and Unemployment in the 1920's and 1930's: A Re-Examination Based on Postwar Experience", 55(1): 46-55. Data prior to 1948 are for persons age 14 and over. Data beginning in 1948 are for persons age 16 and over. Peace01234 (talk) 22:41, 20 August 2010 (UTC)
# User talk:Peace01234
# Visited: 11/1/2010
raw <- "1890; 3.97%. 1891; 4.77%. 1892; 3.72%. 1893; 8.09%. 1894; 12.33%. 1895; 11.11%. 1896; 11.96%. 1897; 12.43%. 1898; 11.62%. 1899; 8.66%. 1900; 5.00%. 1901; 4.59%. 1902; 4.30%. 1903; 4.35%. 1904; 5.08%. 1905; 4.62%. 1906; 3.29%. 1907; 3.57%. 1908; 6.17%. 1909; 5.13%. 1910; 5.86%. 1911; 6.27%. 1912; 5.25%. 1913; 4.93%. 1914; 6.63%. 1915; 7.18%. 1916; 5.63%. 1917; 5.23%. 1918; 3.38%. 1919; 2.95%. 1920; 5.16%. 1921; 8.73%. 1922; 6.93%. 1923; 4.80%. 1924; 5.80%. 1925; 4.92%. 1926; 4.02%. 1927; 4.57%. 1928; 5.02%. 1929; 4.61%. 1930; 8.94%. 1931; 13.00%. 1932; 18.80%. 1933; 19.80%. 1934; 21.30%. 1935; 19.50%. 1936; 16.60%. 1937; 14.10%. 1938; 17.80%. 1939; 16.00%. 1940; 14.60%. 1941; 9.90%. 1942; 4.70%. 1943; 1.90%. 1944; 1.20%. 1945; 1.90%. 1946; 3.90%. 1947; 3.90%. 1948; 3.80%. 1949; 5.90%. 1950; 5.30%. 1951; 3.30%. 1952; 3.00%. 1953; 2.90%. 1954; 5.50%. 1955; 4.40%. 1956; 4.10%. 1957; 4.30%. 1958; 6.80%. 1959; 5.50%. 1960; 5.50%. 1961; 6.70%. 1962; 5.50%. 1963; 5.70%. 1964; 5.20%. 1965; 4.50%. 1966; 3.80%. 1967; 3.80%. 1968; 3.60%. 1969; 3.50%. 1970; 4.90%. 1971; 5.90%. 1972; 5.60%. 1973; 4.90%. 1974; 5.60%. 1975; 8.50%. 1976; 7.70%. 1977; 7.10%. 1978; 6.10%. 1979; 5.80%. 1980; 7.10%. 1981; 7.60%. 1982; 9.70%. 1983; 9.60%. 1984; 7.50%. 1985; 7.20%. 1986; 7.00%. 1987; 6.20%. 1988; 5.50%. 1989; 5.30%. 1990; 5.60%. 1991; 6.80%. 1992; 7.50%. 1993; 6.90%. 1994; 6.10%. 1995; 5.60%. 1996; 5.40%. 1997; 4.90%. 1998; 4.50%. 1999; 4.20%. 2000; 4.00%. 2001; 4.70%. 2002; 5.80%. 2003; 6.00%. 2004; 5.50%. 2005; 5.10%. 2006; 4.60%. 2007; 4.60%. 2008; 5.80%. 2009; 9.30%. 2010; 9.70%"

hold <- strsplit(raw, ". ")[[1]]
this <- as.data.frame(matrix(hold,ncol=2, byrow=TRUE))
year <- as.numeric(as.character(this$V1))
unem <- as.numeric(c(strsplit(as.character(this$V2), "%"), recursive=TRUE))
usData <- year > 1939.5
plot(cbind(year, unem), type='b', col=c('#888888','#225588')[usData+1])
unempl <- data.frame(year=year,unemp=unem,usData=as.numeric(usData))
save(unempl, file='unempl.rda')

