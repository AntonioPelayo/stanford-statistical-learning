# Followed along Lecture 7 regression in R
library(ISLR)
names(Carseats)    # Column names

# Linear model with interactinos between Income:Ads, Age: Price
fit1 = lm(Sales~. + Income:Advertising + Age:Price, Carseats)
summary(fit1)    # R^2 = 0.88

# How R handles qualitative variables
contrasts(Carseats$ShelveLoc)    # Three level variable


## Writing functions
regressionPlot = function(x,y){
  fit = lm(y~x)
  plot(x,y)
  abline(fit, col="orange", lw=2.5)
}

# Call the function to fit price ~ sales
regressionPlot(Carseats$Price, Carseats$Sales)

# Function can take in additional unnamed parameters
regressionPlot = function(x,y,...){
  fit = lm(y~x)
  plot(x,y,...)
  abline(fit, col="orange", lw=2.5)
}

regressionPlot(Carseats$Price, Carseats$Sales,
               xlab="Price", ylab="Sales", pch=20)

