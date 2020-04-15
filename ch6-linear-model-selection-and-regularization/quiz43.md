# Antonio Pelayo
## Quiz 43 Chapter 6 quiz
### 6.Q.1
1/1 point (graded)

Suppose we estimate the regression coefficients in a linear regression model by 
minimizing

∑(y<sub>i</sub> - β<sub>0</sub> − ∑<sub>j</sub><sup>p</sup>β<sub>j</sub>x<sub>ij</sub>)<sup>2</sup>
+ λ∑<sub>j</sub><sup>p</sup>β<sub>j</sub><sup>2</sup>

for a particular value of λ. For each of the following, select the correct 
answer:

As we increase λ from 0, the training RSS will:
- [x] Steadily increase

Explanation:

Increasing λ will force us to fit simpler models. This means that training RSS 
will steadily increase because we are less able to fit the training data exactly.


### 6.Q.2
1/1 point (graded)

As we increase λ from 0, the test RSS will:

Decrease initially, and then eventually start increasing in a U shape.

Explanation:

At first, we expect test RSS to improve because we are not overfitting our 
training data anymore. Eventually, we will start fitting models that are too 
simple to capture the true effects and test RSS will go up.


### 6.Q.3
1/1 point (graded)

As we increase λ from 0, the variance will:

Steadily decrease

Explanation:

Increasing λ will cause us to fit simpler models, which reduces the variance of 
the fits.


### 6.Q.4
1/1 point (graded)

As we increase λ from 0, the (squared) bias will:

Steadily increase

Explanation:

Increasing λ will cause us to fit simpler models, which have larger squared bias.


### 6.Q.5
1/1 point (graded)

As we increase  λ from 0, the irreducible error will:

Remain constant

Explanation:

Increasing λ will have no effect on irreducible error. By definition, 
irreducible error is an aspect of the problem and has nothing to do with a 
particular model being fit.