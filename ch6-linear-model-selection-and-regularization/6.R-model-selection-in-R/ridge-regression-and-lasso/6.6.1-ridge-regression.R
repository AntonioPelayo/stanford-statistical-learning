# Antonio Pelayo April 11, 2020
## 6.6.1 Ridge Regression lab
## Use the 'glmnet' package to perform ridge regression on the Hitters dataset
## and compare the fit accuracy vs a standard least squares model
library(ISLR)
library(glmnet)


# Clean and split data into train and validation sets
set.seed(1)
Hitters = na.omit(Hitters)
x = model.matrix(Salary~., Hitters)[, -1]
y = Hitters$Salary
train = sample(1:nrow(x), nrow(x)/2)  # Random sample
test = (-train)
y.test = y[test]


# Model fitting with lambda = 4 and 1e10
grid = 10^seq(10, -2, length=100)
ridge.mod = glmnet(x[train, ], y[train], alpha=0, lambda=grid, thresh=1e-12)
ridge1.pred = predict(ridge.mod, s=4, newx=x[test,])
ridge1.mse = mean((ridge1.pred - y.test)^2)  # 142,199

ridge2.pred = predict(ridge.mod, s=1e10, newx=x[test,])
ridge2.mse = mean((ridge2.pred - y.test)^2)  # 224,669


# Linear model fit (unpenalized) lambda = 0
ridge3.pred = predict(ridge.mod, x=x[train,], y=y[train], s=0, newx=x[test,], exact=T)
ridge3.mse = mean((ridge3.pred - y.test)^2)  # 168,588
lm.fit = lm(y~x, subset=train)
lm.pred = predict(x=x[train,], y=y[train], ridge.mod, s=0, exact=T, type="coefficients")[1:20,]


# Use CV to determine lambda to use that minimizes mse
set.seed(1)
cv.out = cv.glmnet(x[train,], y[train], alpha=0)  # Ridge regression
plot(cv.out)
bestlambda = cv.out$lambda.min  # 326.08


# Fit Ridge Regression using optimal lambda on training data
bestRidge.pred = predict(ridge.mod, s=bestlambda, newx=x[test,])
bestRidge.mse = mean((bestRidge.pred - y.test)^2)  # 139,856


# Fit best lambda on all data
out = glmnet(x, y, alpha=0)
out.pred = predict(out, type="coefficients", s=bestlambda)[1:20,]
out.pred  # Show final model coef.
