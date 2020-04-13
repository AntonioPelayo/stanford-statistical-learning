# 6.6.2 The Lasso
## In the previous lab it was seen that with a good choice for lambda it is 
## possible for ridge regression to perform better than least squares regression.
## We will now see if the Lasso improves accuracy or interpretablility
library(ISLR)
library(glmnet)


# Prep data
Hitters = na.omit(Hitters)
grid = 10^seq(10, -2, length=100)
x = model.matrix(Salary~., Hitters)[, -1]
y = Hitters$Salary
set.seed(1)
train = sample(1:nrow(x), nrow(x)/2)  # Random sample
test = (-train)
y.test = y[test]
  

# Fit lasso on training data
lasso.mod = glmnet(x[train,], y[train], alpha=1, lambda=grid)
plot(lasso.mod)


# Compute test error using CV
cv.out = cv.glmnet(x[train,], y[train], alpha=1)
plot(cv.out)  # MSE x Log(lambda)
bestlambda = cv.out$lambda.min  # 9.2870
lasso.pred = predict(lasso.mod, s=bestlambda, newx=x[test,])
lasso.mse = mean((lasso.pred - y.test)^2)  # 143,673.6185


# Fit final model on all data
out = glmnet(x,y, alpha=1, lamda=grid)
lasso.coef = predict(out, type="coefficients", s=bestlambda)[1:20,]
lasso.coef  # Note 10 out of 19 predictors are zeroed out with the best fit lambda
