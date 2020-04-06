# Antonio Pelayo
## Quiz 33 Stepwise Selection
### 6.2.R1
1/1 point (graded)

We perform best subset and forward stepwise selection on a single dataset. For 
both approaches, we obtain p + 1 models, containing 0,1,2,…,p predictors.

Which of the two models with k predictors is guaranteed to have training RSS no 
larger than the other model?

- [x] Best Subset correct
- [ ] Forward Stepwise
- [ ] They always have the same training RSS
- [ ] Not enough information is given to know

### 6.2.R2
1/1 point (graded)

Which of the two models with k predictors has the smallest test RSS?

- [ ] Best Subset
- [ ] Forward Stepwise
- [ ] They always have the same test RSS
- [x] Not enough information is given to know correct

Explanation:

We know that Best Subset selection will always have the lowest training RSS 
(that is how it is defined). That said, we don't know which model will perform 
better on a test set.