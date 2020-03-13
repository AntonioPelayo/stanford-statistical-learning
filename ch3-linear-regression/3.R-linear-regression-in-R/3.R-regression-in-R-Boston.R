# Followed along Lecture 7 regression in R
library(MASS)
library(ISLR)

## Linear regression
# names(Boston)    # Column names
# ?Bostion         # More data set info
plot(medv~lstat,data=Boston)    # Response~Predictor
fit1 = lm(medv~lstat, data=Boston)    # Linear model 1
summary(fit1)   # R^2 = 0.54
abline(fit1, col="orange", lw=2)    # Add line to plot
# confint(fit1)
predict(fit1, data.frame=c(5, 10, 15), interval="confidence")

## Multiple linear regression
fit2 = lm(medv~lstat+age, data=Boston)    # Age + lstat with no interaction term
summary(fit2)    # R^2 = 0.55

fit3 = lm(medv~., data=Boston)    # Use all columns as predictors
summary(fit3)    # R^2 = 0.74

## Plot residuals
par(mfrow=c(2,2))
plot(fit3)    

# Refit plot 3
fit4 = update(fit3, ~.-age-indus)    # Same response, minus age, minus indus
summary(fit4)    # R^2 = 0.74

## Nonlinear terms and Interactions
fit5 = lm(medv~lstat*age, Boston)    # Pure effects and interaction terms
summary(fit5)    # R^2 = 0.56

fit6 = lm(medv~lstat + I(lstat^2), Boston)    # lstat + lstat squared. still linear model
summary(fit6)    # R^2 = 0.64

attach(Boston)
par(mfrow=c(1,1))
plot(medv~lstat)
points(lstat, fitted(fit6), col='orange', pch=20)    # Solid dot 

## Polynomial fit
fit7 = lm(medv~poly(lstat, 4))    # Degree 4
summary(fit7)    # R^2 = 0.67 too wiggly. 
points(lstat, fitted(fit7), col="blue", pch=20)
