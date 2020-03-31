# 4.6.4 Quadratic Discriminant Analysis
library(ISLR)
library(MASS)
attach(Smarket)

# Fit QDA on train data (Year < 2005)
train = (Year < 2005)
qda.fit = qda(Direction~Lag1+Lag2, data=Smarket, subset=train)
qda.fit    # Show group means

# Get predictions for classes on 2005 data
qda.class = predict(qda.fit, Smarket.2005)$class
Direction.2005 = Direction[!train]
table(qda.class, Direction.2005)   # Confusion matrix
mean(qda.class==Direction.2005)    # Compute correct predictions
