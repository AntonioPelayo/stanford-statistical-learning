# 4.6.1 The stock market data
library(ISLR)
attach(Smarket)
# head(Smarket)
# summary(Smarket)
cor(Smarket[,-9])    # Correlation matrix of columns 0-9
plot(Volume)         # The only correlation seems to be year and volume


# 4.6.2 Logistic Regression
# The goal of this section is to predict Direction (up/down)
# using Lag1-Lag5 and Volume with a logistic regression model.
fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
          data=Smarket, family=binomial)
summary(fit)    # We can see which columns might be most correlated

# Predict that the market will go up
fit.probs = predict(fit, type="response")
fit.probs[1:10]                     # show first 10 predictions
contrasts(Direction)                # 1 corresponds to up, 0 for market down

# Turn predicted probabilities into class labels
fit.pred = rep("Down", 1250)        # Create "Down" elements for each data point
fit.pred[fit.probs > 0.5] = "Up"    # Transform those to "Up" if prob > 0.5
table(fit.pred, Direction)          # Create confusion matrix
mean(fit.pred == Direction)         # Compute fraction of correct prediction


## Train on data with year < 2005 
train = (Year < 2005)
Smarket.2005 = Smarket[!train,]    # Vector with only 2005 data
Direction.2005 = Direction[!train]
fit2 = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, 
           data=Smarket, family=binomial, subset=train)
fit2.probs = predict(fit2, Smarket.2005, type="response")
fit2.pred = rep("Down", 252)
fit2.pred[fit2.probs > 0.5] = "Up"
table(fit2.pred, Direction.2005)     # Confusion matrix 
mean(fit2.pred != Direction.2005)    # 0.52 test set error


## Fit model with only Lag1 and Lag2
fit3 = glm(Direction~Lag1+Lag2, data=Smarket, family=binomial ,subset=train)
fit3.probs = predict(fit3, Smarket.2005, type="response")
fit3.pred = rep("Down", 252)
fit3.pred[fit3.probs > 0.5] = "Up"
table(fit3.pred, Direction.2005)
mean(fit3.pred != Direction.2005)    # 0.44 test set error

# Predict returns associated with specific values of Lag1 and Lag2
predict(fit3, newdata=data.frame(Lag1=c(1.2,1.5), Lag2=c(1.1,-0.8)), type="response")
