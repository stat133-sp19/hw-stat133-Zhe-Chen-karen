## ---- echo=FALSE, message=FALSE------------------------------------------
knitr::opts_chunk$set(collapse = T,comment = "#>")
library(binomial)

## ------------------------------------------------------------------------
#mean
bin_mean(10, 0.3)
#variance
bin_variance(10, 0.3)
#mode
bin_mode(10, 0.3)
#skewness
bin_skewness(10, 0.3)
#kurtosis
bin_kurtosis(10, 0.3)

## ------------------------------------------------------------------------
bin_choose(n = 5, k = 2)

## ------------------------------------------------------------------------
bin_probability(success=3,trials=5,prob=0.5)

## ------------------------------------------------------------------------
bin1<-bin_variable(trials=5,prob=0.5)
bin1

## ------------------------------------------------------------------------
summary(bin1)

## ------------------------------------------------------------------------
dist1=bin_distribution(trials=5,prob=0.5)
dist1

## ------------------------------------------------------------------------
dist2=bin_cumulative(trials=5,prob=0.5)
dist2

## ------------------------------------------------------------------------
# plotting binomial probability distribution
dist1=bin_distribution(trials=5,prob=0.5)
plot(dist1)

## ------------------------------------------------------------------------
# plotting binomial cumulative distribution
dist2 <- bin_cumulative(trials = 5, prob = 0.5)
plot(dist2)

