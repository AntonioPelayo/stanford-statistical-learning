# Antonio Pelayo
## Quiz 28 5.4 the Bootstrap
### 5.4.R1
1/1 point (graded)

One way of carrying out the bootstrap is to average equally over all possible 
bootstrap samples from the original data set (where two bootstrap data sets are 
different if they have the same data points but in different order). Unlike the 
usual implementation of the bootstrap, this method has the advantage of not 
introducing extra noise due to resampling randomly. (You can use "^" to denote 
power, as in "n^2")

To carry out this implementation on a data set with n data points, how many 
bootstrap data sets would we need to average over?

n<sup>n</sup>

Explanation:

Completely removing the bootstrap resampling noise is usually not worth 
incurring the extreme computational cost. If B is large, but still less than 
n^n, random resampling gives a good Monte Carlo estimate of the idealized 
bootstrap estimate for all n^n data sets