# 5.3.1 Validation set approach
# In this project we use the validation set approach of splitting our data
# to see that over different data sets, the quadratic model fits better 
# than the linear model of mpg~horsepower

library(ISLR)
plot(mpg~horsepower, data=Auto)
set.seed(0)    # Reproducibility

# Train linear model using train set
train = sample(392, 196)     # 196 of 392 in train
lm.fit = lm(mpg~horsepower, data=Auto, subset=train)
attach(Auto)
mean((mpg - predict(lm.fit, Auto))[-train]^2)    # MSE: 24.24

# Train quadratic model
lm.fit2 = lm(mpg~poly(horsepower, 2), data=Auto, subset=train)
mean((mpg - predict(lm.fit2, Auto))[-train]^2)    # MSE: 19.56

# Train cubic model
lm.fit3 = lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((mpg - predict(lm.fit3, Auto))[-train]^2)    # MSE: 19.70


# New seed to reproduce models on a different subset of the Auto data
set.seed(1)
train = sample(392, 196)     # 196 of 392 in train

# Train linear model 
lm.fit = lm(mpg~horsepower, data=Auto, subset=train)
mean((mpg - predict(lm.fit, Auto))[-train]^2)    # MSE: 23.27

# Train quadratic model
lm.fit2 = lm(mpg~poly(horsepower, 2), data=Auto, subset=train)
mean((mpg - predict(lm.fit2, Auto))[-train]^2)    # MSE: 18.72

# Train cubic model
lm.fit3 = lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((mpg - predict(lm.fit3, Auto))[-train]^2)    # MSE: 18.79

## We can see that quadratic and cubic models both still have lower
## MSE than the linear models
