# Quiz 17 Antonio Pelayo March 14, 2020
## 4.3 Multivariate Logistic Regression
### 4.3.R1

1/1 point (graded)

Suppose we collect data for a group of students in a statistics class with 
variables X<sub>1</sub> = hours studied, X<sub>2</sub> = undergrad GPA, and 
Y = receive an A. We fit a logistic regression and produce estimated 
coefficients $`\hat{\beta_0} = -6, \hat{\beta_1} = 0.05, \hat{\beta_2} = 1`$.

Estimate the probability that a student who studies for 40h and has an 
undergrad GPA of 3.5 gets an A in the class (within 0.01 accuracy):

```{r}
> ProbAinClass = function(B0, B1, B2, X1, X2){
+   # X_1 = Hours studies
+   # X_2 = Undergrad GPA
+   # Return probablility student recieves an A
+   numerator = exp(B0 + (B1 * X1) + (B2 * X2))
+   return(numerator / (1 + numerator))
+ }
> ProbAinClass(-6, 0.05, 1, 40, 3.5)
[1] 0.3775407
```
Explanation:

We know that
```math
P((40, 3.5)) = \frac{e^{-6 + 0.05*40 + 1*3.5}}{1 + e^{-6 + 0.05*40 + 1*3.5}}
             = 0.3775407
```
### 4.3.R2
1/1 point (graded)

How many hours would that student need to study to have a 50% chance of getting an A in the class?:


```{r}
> hoursToStudy = function(Px,B0, B1, B2, X2){
+   return((log(Px / (1-Px)) - B0 - (B2 * X2)) / B1)
+ }
> hoursToStudy(.5, -6, 0.05, 1, 3.5)
[1] 50
```
Explanation:

We have 
```math
P((h, 3.5)) = \frac{e^{-6 + 0.05*h + 1*3.5}}{1 + e^{-6 + 0.05*h + 1*3.5}} = 0.5

```
Rearranging gives $`−6 + .05*h + 1* 3.5 = 0`$ or h = 50