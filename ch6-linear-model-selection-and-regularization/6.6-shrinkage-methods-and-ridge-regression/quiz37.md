# Antonio Pelayo
## Quiz 37 Shrinkage methods and ridge regression
### 6.6.R1
1/1 point (graded)

sqrt(∑<sub>j=1</sub><sup>p</sup>β<sub>j</sub><sup>2</sup> is equivalent to:

- [ ] Xβ^
- [ ] β^<sup>R</sup>
- [ ] C<sub>p</sub> statistic
- [x] ‖β‖<sub>2</sub>

Explanation:

The expression is the L2 norm of β.


### 6.6.R2
1/1 point (graded)

You perform ridge regression on a problem where your third predictor, x3, is 
measured in dollars. You decide to refit the model after changing x3 to be 
measured in cents. Which of the following is true?:

- [ ] β^<sub>3</sub> and y^ will remain the same.
- [ ] β^<sub>3</sub> will change but y^ will remain the same.
- [ ] β^<sub>3</sub> will remain the same but y^ will change.
- [x] β^<sub>3</sub> and y^ will both change.

Explanation:

The units of the predictors affects the L2 penalty in ridge regression, and 
hence β^<sub>3</sub> and y^ will both change