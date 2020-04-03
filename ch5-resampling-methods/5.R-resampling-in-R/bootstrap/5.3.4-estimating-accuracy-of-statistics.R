# 5.3.4 The Bootstrap
## Use the bootstrap method to estimate the accuracy of a Statistic of Interest
## on the Portfolio data set and estimate the accuracy of a linear regression
## model on the Auto data set.
library(boot)
library(ISLR)
set.seed(0)

# Sample statistic accuracy
alpha.fn = function(data, index){
  # Output an estimate for alpha using the observations in index
  X = data$X[index]
  Y = data$Y[index]
  return ((var(Y) - cov(X,Y)) / (var(X) + var(Y) - 2 * cov(X,Y)))
}

# Estimate alpha on Portfolio
alpha.fn(Portfolio, 1:100)    # Using pts 1:100
alpha.fn(Portfolio, sample(100, 100, replace=T))    # 100 Samples with replacement

# Compute S.E. with boot()
boot(Portfolio, alpha.fn, R=1000)
