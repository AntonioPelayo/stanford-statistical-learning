# Import libraries
library(MASS)
library(ISLR)

# Using the Boston data set
names(Boston)  # Column names
# ?Boston

# Find the quartiles of our columns and remove outliers
summary(medv)
summary(lstat)
Boston = Boston[Boston$medv < 37 & Boston$lstat < 32,]
plot(Boston$medv~Boston$lstat, 
      xlab="Percent population in low-status",
      ylab="Median housing price")

# Fit linear model
lm.fit = lm(medv~lstat, Boston)
lm.fit             # Display regression equation coefficients
summary(lm.fit)    # Show residuals and coefficients
confint(lm.fit)    # 95% confidence interval for slope and intercept

# Make prediction intervals for lstat values of 5, 10, and 15
predict(lm.fit, data.frame(lstat=c(5, 10, 15)),
        interval="confidence")

# Add least squares regression line to plot
abline(lm.fit, lwd=2, col="orange")

# 2x2 grid for diagnostics
par(mfrow=c(2,2))
plot(Boston$medv~Boston$lstat, 
    xlab="Percent population in low-status",
    ylab="Median housing price")
abline(lm.fit, lwd=2, col="orange")       # Scatter and regression plot
plot(predict(lm.fit), residuals(lm.fit))  # Residuals plot
plot(predict(lm.fit), rstudent(lm.fit))   # Studentized residuals
plot(hatvalues(lm.fit))                   # Leverage stats