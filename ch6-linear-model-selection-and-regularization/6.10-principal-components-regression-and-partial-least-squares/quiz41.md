# Antonio Pelayo
## Quiz 41 Principal components regression adn partial least squares
### 6.10.R1
1/1 point (graded)

You are working on a regression problem with many variables, so you decide to do
Principal Components Analysis first and then fit the regression to the first 2 
principal components. Which of the following would you expect to happen?:

- [ ] A subset of the features will be selected
- [ ] Model Bias will decrease relative to the full least squares model
- [x] Variance of fitted values will decrease relative to the full least squares model correct
- [ ] Model interpretability will improve relative to the full least squares model

Explanation:

While some forms of dimensional reduction will cause the first or fourth to 
occur, that is not the case with PCA. When using dimensional reduction we 
restrict ourselves to simpler models. Thus, we expect bias to increase and 
variance to decrease.