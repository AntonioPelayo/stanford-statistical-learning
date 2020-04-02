# Antonio Pelayo
## Quiz 29 5.5 More on the Bootstrap
### 5.5.R1
1/1 point (graded)

If we have n data points, what is the probability that a given data point does 
not appear in a bootstrap sample?

(1-1/n)<sup>n</sup>

Explanation:

To construct a bootstrap sample, we repeatedly draw a single data point from a 
sample of size n, n times. Any given data point has a 1-1/n chance of not being 
selected in each draw. Hence, the chance of not being selected in any of the n 
draws is (1-1/n)^n