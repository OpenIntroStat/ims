#===> simulate data <===#
set.seed(1)
X <- 330:830
Y <- 1000-0.005*(X-760)^2
hist(fico <- sample(X, 70, TRUE, Y))
fico <- fico[fico < 750]
defa <- 0.7-0.001*(fico-300)
plot(fico, defa)







X <- 70 + 15*rt(40, 8)
Y <- 400 + (X-55)*12 - 0.1*(X-55)^2 + rnorm(length(X), sd=70)
plot(X, Y)

#===> fit a model <===#
g <- lm(Y ~ X) # + I(X^2))
summary(g)
abline(g)


d <- read.delim("http://lib.stat.cmu.edu/datasets/federalistpapers.txt", skip=12)

plot(d$ThinkPositive, d$ThinkingAhead, col=d$Group)

X <- runif(50, 









