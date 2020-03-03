# Quiz 4
## 2.3 Review Questions
### 2.3 R1
1/1 point (graded)

True or False: A fitted model with more predictors will necessarily have a lower Training Set Error than a model with fewer predictors.

- [ ] True
- [x] False

Explanation: 

False. While we typically expect a model with more predictors to have lower Training Set Error, it is not necessarily the case. An extreme counterexample would be a case where you have a model with one predictor that is always equal to the response, compared to a model with many predictors that are random.


### 2.3 R2
1/1 point (graded)

While doing a homework assignment, you fit a Linear Model to your data set. You are thinking about changing the Linear Model to a Quadratic one. Which of the following is most likely true:


- [ ] Using the Quadratic Model will decrease your Irreducible Error.
- [x] Using the Quadratic Model will decrease the Bias of your model.
- [ ] Using the Quadratic Model will decrease the Variance of your model
- [ ] Using the Quadratic Model will decrease your Reducible Error

Explanation:

Introducing the quadratic term will make your model more complicated. More complicated models typically have lower bias at the cost of higher variance. This has an unclear effect on Reducible Error (could go up or down) and no effect on Irreducible Error.