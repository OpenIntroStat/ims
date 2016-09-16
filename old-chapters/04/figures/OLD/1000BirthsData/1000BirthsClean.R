#===> take sample <===#
set.seed(2)
d <- read.delim('1000Births.txt')
x <- sample(which(d$smoker == 'smoker'), 50)
y <- sample(which(d$smoker == 'nonsmoker'), 100)
samp <- sample(c(x,y))
d <- d[samp,]
row.names(d) <- NULL
colnames(d) <- c('fAge', 'mAge', 'mAgeGroup', 'weeks', 'premature', 'visits', 'marital', 'racemom', 'hispmom', 'gained', 'weight', 'weightGroup', 'sexBaby', 'smoke')
write.table(d, '150Births.txt', quote=FALSE, sep='\t', row.names=FALSE, col.names=TRUE)

#===> print out <===#
require(xtable)
xtable(d[c(1,2,3,150),c(1,4,11,13,14)])
t.test(d$weight ~ d$smoke)