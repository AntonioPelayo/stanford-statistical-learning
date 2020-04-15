# 6.7.1 Principal Components Regression
## In this lab we will use PCR on the Hitters dataset to predict Salary once
## more such that we can compare to previous models on the same data.
library(ISLR)
library(pls)


# Fit PCR model using 10-fold cross-validtaion on whole dataset
Hitters = na.omit(Hitters)
pcr.fit = pcr(Salary~., data=Hitters, scale=TRUE, validation="CV")
summary(pcr.fit)
validationplot(pcr.fit, val.type="MSEP")


# Fit PCR on training data
set.seed(0)
train = sample(c(TRUE, FALSE), nrow(Hitters), rep=TRUE)
x = model.matrix(Salary~., Hitters)[, -1]
y = Hitters$Salary
test = (!train)
y.test = y[test]
set.seed(0)
pcr.fit = pcr(Salary~., data=Hitters, subset=train, scale=TRUE, validation="CV")
validationplot(pcr.fit, val.type="MSEP")  # M = 6 Seems to be the best tradeoff


# Use M = 6 to compute test MSE
pcr.pred = predict(pcr.fit, x[test,], ncomp=6)
mean((pcr.pred - y.test)^2)


# Final fit on full dataset PCR with M = 6
pcr.fit = pcr(y~x, scale=TRUE, ncomp=6)
summary(pcr.fit)
