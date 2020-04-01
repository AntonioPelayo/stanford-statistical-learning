# 5.3.2 Leave-One-Out Cross-Validation
## The purpose of this lab is to show how computationally expensive LOOCV can be
## fit linear and polynomial models to determine which has the best fit by using
## MSE through LOOCV
library(ISLR)
library(boot)
plot(mpg~horsepower, data=Auto)


# Fit linear model
glm.fit = glm(mpg~horsepower, data=Auto)
# coef(lm.fit)                      # m = -0.158, b = 39.936
cv.error = cv.glm(Auto, glm.fit)    # Store error of linear model
cv.error$delta                      # MSE of 24.23

# Compute MSE using equation (5.2) in the text
loocv = function(fit){
  h = lm.influence(fit)$h               # Grab leverage
  mean((residuals(fit) / (1 - h))^2)    # MSE
}
loocv(glm.fit)    # Lots faster than cv.glm()

# Compute CV MSE for increasing orders of polynomial fit
cv.pError = rep(0, 5)
degree = 1:5
for (i in degree) {
  glm.fit = glm(mpg~poly(horsepower, i), data=Auto)
  cv.pError[i] = loocv(glm.fit)
}
cv.pError    # Show errors for polynomials of order 1-5

# Plot MSE for polynomials
plot(degree, cv.pError, type='b')    

## We can see that the second and fifth order polynomials have massively better
## fits to the data than a linear model. Though they may tend to over fit with 
## increasing order.
