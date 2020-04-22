# 6.7.2 Partial Least Squares
# Antonio Pelayo April 21, 2020
## This lab we will implement Partial Least Squares reguression from the `pls`
## library and compare MSE results to previous labs also on the Hitters dataset
library(ISLR)
library(pls)

# Handle data
Hitters = na.omit(Hitters)    # Remove rows with na data
set.seed(0)
train = sample(c(TRUE, FALSE), nrow(Hitters), rep=TRUE)
test = (!train)
x = model.matrix(Salary~., Hitters)[, -1]
y = Hitters$Salary
y.test = y[test]


# Fit PLS model with 10 fold validation 
set.seed(0)
pls.fit = plsr(Salary~., data=Hitters, subset=train, scale=TRUE, validation="CV")
summary(pls.fit)    # Lowest CV value at 2 components
validationplot(pls.fit, val.type="MSEP")

# Predict with model containing 2 components
pls.pred = predict(pls.fit, x[test,], ncomp=2)
mean((pls.pred - y.test)^2)  # MSE 103,439.9

# Train pls on full data with 2 components
pls.fit = plsr(Salary~., data=Hitters, scale=TRUE, ncomp=2)
summary(pls.fit)    # 43% of variance explained with 2 components

