# 6.5.1 Best Subset Selection
## Using subset selection methods to predict a baseball players salary from the
## Hitters dataset inlcuded in the ISLR library
library(ISLR)
library(leaps)
# summary(Hitters)
Hitters = na.omit(Hitters)  # Omit rows with missing values


# Get best subset to predict salary
regfit.full = regsubsets(Salary~., data=Hitters, nvmax=19)
# summary(regfit.full)  # Display predictors used for each model with 1:p predictors
reg.summary = summary(regfit.full)
reg.summary$rsq  # R^2 value for each 1:p predictor model


# Plot RSS, R^2, C_p and BIC for all models to determine selection
par(mfrow=c(2,2))
plot(reg.summary$rss, xlab="Num variables", ylab="RSS")

# Grab model with highest R^2 value
plot(reg.summary$adjr2, xlab="Num variables", ylab="Adj. R^2")
max.r2 = which.max(reg.summary$adjr2)
points(max.r2, reg.summary$adjr2[max.r2], col="red", cex=2, pch=20)

# Plot C_p and BIC similarly though finding thier minimums
plot(reg.summary$cp, xlab="Num variables", ylab="C_p")
cp.min = which.min(reg.summary$cp)
points(cp.min, reg.summary$cp[cp.min], col="red", cex=2, pch=20)
plot(reg.summary$bic, xlab="Num variables", ylab="BIC")
bic.min = which.min(reg.summary$bic)
points(bic.min, reg.summary$bic[bic.min], col="red", cex=2, pch=20)


# Plot best model with selected variables
plot(regfit.full, scale="r2")
plot(regfit.full, scale="adjr2")
plot(regfit.full, scale="Cp")
plot(regfit.full, scale="bic")

coef(regfit.full, 10)  # Coefficients for 'best' model with 10 parameters
