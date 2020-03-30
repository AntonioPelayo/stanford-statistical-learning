# 4.6.3 Linear Discriminant Analysis
library(ISLR)
library(MASS)
attach(Smarket)

# Fit model on previous two days return
lda.fit = lda(Direction~Lag1+Lag2, data=Smarket, subset=Year<2005)
lda.fit    # Prior probs 
plot(lda.fit)

Smarket.2005 = subset(Smarket, Year==2005)
lda.pred = predict(lda.fit, Smarket.2005)
# names(lda.predict)

lda.class = lda.pred$class
table(lda.class, Smarket.2005$Direction, Smarket.2005$Direction)
mean(lda.class==Smarket.2005$Direction)    # 0.56 correct market directions

# Apply 50% threshold to posterior probs to recreate predicitons
sum(lda.pred$posterior[,1] >= 0.5)
sum(lda.pred$posterior[,1] < 0.5)

lda.pred$posterior[1:20, 1]    # Predict down if posterior > 0.5
lda.class[1:20]                # True classifications 

# Wish to predict down day only if posterior probability is > 90%
sum(lda.pred$posterior[,1] > 0.9)    # No days fall under this threshold
