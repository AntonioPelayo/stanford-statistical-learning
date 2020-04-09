# 6.5.3 Choosing Models Using Validation Sets and Cross Validation
## In this lab we will use validation sets and k-fold cross validation to
## determine which of our best subset models predicts the Salary in the Hitters
## dataset best
library(ISLR)
library(leaps)
set.seed(1)

# Filter and split the data
Hitters = na.omit(Hitters)
train = sample(c(TRUE, FALSE), nrow(Hitters), rep=TRUE)
test = (!train)

# Fit best subset on train data
regfit.best = regsubsets(Salary~., data=Hitters[train,], nvmax=19)
test.mat = model.matrix(Salary~., data=Hitters[test,])

# Compute test MSE for each best fit modelA
validation.errors = rep(NA, 19)
for(i in 1:19) {
  coefi = coef(regfit.best, id=i)
  prediction = test.mat[,names(coefi)]%*%coefi
  validation.errors[i] = mean((Hitters$Salary[test] - prediction)^2)
}
which.min(validation.errors)  # Model with lowest MSE
coef(regfit.best, which.min(validation.errors))  # Display model coef.

# Derive a prediction method for regfit
predict.regsubsets = function(object, newdata, id, ...) {
  formula = as.formula(object$call[[2]])
  mat = model.matrix(formula, newdata)
  coefi = coef(object ,id=id)
  mat[, names(coefi)]%*%coefi
}

# Finally fit best subsets on whole data
regfit.best = regsubsets(Salary~., data=Hitters, nvmax=19)
coef(regfit.best, 7)


# Use k-Fold Cross Validation to find the best model
k = 10
set.seed(1)
folds = sample(1:k, nrow(Hitters), replace=TRUE)
cv.errors = matrix(NA, k, 19, dimnames=list(NULL, paste(1:19)))

# Compute MSE for each fold
for (k in 1:10) {
  best.fit = regsubsets(Salary~., data=Hitters[folds!=k, ], nvmax=19, method="forward")
  for (i in 1:19) {
    pred = predict(best.fit, Hitters[folds==k,], id=i)
    cv.errors[k, i] = mean((Hitters$Salary[folds==k] - pred)^2)
  }
}

# Average MSE over folds
mean.cv.errors = apply(cv.errors, 2, mean)  # Vector with average MSE for each model
mean.cv.errors

# Plot MSE for each model 
plot(mean.cv.errors, type='b')

# Print best model coefficients
reg.best = regsubsets(Salary~., data=Hitters, nvmax=19)
coef(reg.best, which.min(mean.cv.errors))
