# 5.3.3 k-Fold Cross-Validation
## This lab is to show how to impliment k-fold CV on the Auto data set to
## model mpg based on horsepower using different orders of polynomials with
## 10 folds.
library(ISLR)
library(boot)
plot(mpg~horsepower, data=Auto)
# set.seed(0)    # Reproducibility

cv.error10 = rep(0, 10)
for (i in 1:10) {
  glm.fit = glm(mpg~poly(horsepower, i), data=Auto)       # Fit model 
  cv.error10[i] = cv.glm(Auto, glm.fit, K=10)$delta[1]    # Append MSE to vector
}
cv.error10
plot(1:10, cv.error10, type='b')    # Plot errors for polynomial fits

## As we can see by the model, the fits are smilar to LOOCV though less 
## computationally exhausting. 
