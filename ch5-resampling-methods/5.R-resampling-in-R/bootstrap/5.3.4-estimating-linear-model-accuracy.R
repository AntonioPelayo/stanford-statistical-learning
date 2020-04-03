# 5.3.4 Estimating the Accuracy of a Linear Regression model
## We will assess the variability of coefficient estimates and model predictions
## on the Auto dataset modeling mpg~horsepower.
library(ISLR)
library(boot)
set.seed(0)

# Define a bootstrap function to return model coef
boot.fn = function(data, index){
  model = lm(mpg~horsepower, data=data, subset=index)
  return(coef(model))
}
boot.fn(Auto, 1:392)
  
# Random samples with replacement
for (i in 1:10)
  print(boot.fn(Auto, sample(392, 392, replace=T)))

# Compute some standard errors
boot(Auto, boot.fn, 1000)

# Find SE estimates through the linear model
summary(lm(mpg~horsepower, data=Auto))$coef

## It should be noted that as the bootstrap doesn't make as many assumptions it
## may be a more accurate estimator that summary().
## Lets try a quadratic model.

boot.fn = function(data, index){
  model = lm(mpg~horsepower*I(horsepower^2), data=data, subset=index)
  coefficients(model)
}
boot(Auto, boot.fn, 1000)

summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef




