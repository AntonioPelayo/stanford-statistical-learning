# 4.6.5 K-Nearest Neighbors
library(class)
attach(Smarket)

# Split data for train and test
train = (Year < 2005)
train.X = cbind(Lag1, Lag2)[train,]    # Train predictors
test.X = cbind(Lag1, Lag2)[!train,]    # Test predictors
train.Direction = Direction[train]     # Direction labels for train data

# Predict movement with one neighbor
set.seed(1)
knn.pred = knn(train.X, test.X, train.Direction, k=1)
table(knn.pred, Direction.2005)        # Observe 50% correct observations

# Predict with 3 neighbors
knn.pred = knn(train.X, test.X, train.Direction, k=3)
table(knn.pred, Direction.2005)
mean(knn.pred == Direction.2005)    # 53.6% though still not better than QDA
