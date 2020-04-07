# 6.5.2 Forward and Backward Stepwise Selection
## COmpare fits and predictors of each model we develop that uses a different
## subset selection method.
library(ISLR)
library(leaps)
Hitters = na.omit(Hitters)  # Remove null values


# We will fit and plot R^2 values for each model
par(mfrow=c(2,2))
# Best Subset Selection
regfit.full = regsubsets(Salary~., Hitters, nvmax=19)
full.summary = summary(regfit.full)
plot(full.summary$adjr2, xlab="Number of Variables", ylab="Full Adj. R^2")
points(which.max(full.summary$adjr2), 
       full.summary$adjr2[which.max(full.summary$adjr2)], 
       col="red", 
       cex=2,
       pch=20)

# Forward Stepwise Selection
regfit.fwd = regsubsets(Salary~., Hitters, nvmax=19, method="forward")
fwd.summary = summary(regfit.fwd)
plot(fwd.summary$adjr2, xlab="Number of Variables", ylab="Fwd. Adj. R^2")
points(which.max(fwd.summary$adjr2), 
       fwd.summary$adjr2[which.max(fwd.summary$adjr2)], 
       col="red", 
       cex=2,
       pch=20)

# Backward Stepwise Selection
regfit.bwd = regsubsets(Salary~., Hitters, nvmax=19, method="backward")
bwd.summary = summary(regfit.bwd)
plot(bwd.summary$adjr2, xlab="Number of Variables", ylab="Bwd. Adj. R^2")
points(which.max(bwd.summary$adjr2), 
       bwd.summary$adjr2[which.max(bwd.summary$adjr2)], 
       col="red", 
       cex=2,
       pch=20)

# Now we will compare choices for predictors for each best fit model
# Its interesting to see that fwd and best subset have mostly the same variables
coef(regfit.full, 7)
coef(regfit.fwd, 7)
coef(regfit.bwd, 7)

