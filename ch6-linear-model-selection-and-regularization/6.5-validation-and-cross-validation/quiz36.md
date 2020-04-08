# Antonio Pelayo
## Quiz 36 Validation and cross-validation
### 6.5.R1
1/1 point (graded)

You are doing a simulation in order to compare the effect of using Cross-
Validation or a Validation set. For each iteration of the simulation, you 
generate new data and then use both Cross-Validation and a Validation set in 
order to determine the optimal number of predictors. Which of the following is 
most likely?

- [ ] The Cross-Validation method will result in a higher variance of optimal number of predictors
- [x] The Validation set method will result in a higher variance of optimal number of predictors correct
- [ ] Both methods will produce results with the same variance of optimal number of predictors
- [ ] Not enough information is given to decide

Explanation:

Cross-Validation is similar to doing a Validation set multiple times and then 
averaging the answers. As such, we expect it to have lower variance than the 
Validation set method. This is why Cross-Validation is appealing (especially 
for small n).