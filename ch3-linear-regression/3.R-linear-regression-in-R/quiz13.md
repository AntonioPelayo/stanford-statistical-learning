# Quiz 13 Antonio Pelayo March 10, 2020 
## 3.R Review questions
### 3.R.R1
1/1 point (graded)

What is the difference between lm(y ~ x*z) and lm(y ~ I(x*z)), when x and z are 
both numeric variables?

- [ ] The first one includes an interaction term between x and z, whereas the second uses the product of x and z as a predictor in the model. correct
- [ ] The second one includes an interaction term between x and z, whereas the first uses the product of x and z as a predictor in the model.
- [ ] The first includes only an interaction term for x and z, while the second includes both interaction effects and main effects.
- [x] The second includes only an interaction term for x and z, while the first includes both interaction effects and main effects. correct

Explanation:

An interaction term between a numeric x and z is just the product of x and z. 
The difference is that in the first model, lm processes the "*" operator between 
variables and automatically includes main effects, whereas in the latter model, 
the expression inside the I() function is not parsed as a part of the formula, 
but rather is simply evaluated.

