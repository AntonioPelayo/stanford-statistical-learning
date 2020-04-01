# Antonio Pelayo
## Quiz 30 Resampling in R
### 5.R.R1
1/1 point (graded)

Download the file 5.R.RData and load it into R using load("5.R.RData"). 
Consider the linear regression model of y on X1 and X2. What is the standard 
error for β<sub>1</sub>?
 
0.02593
 
Explanation:

Use summary(lm(y~.,data=Xy))


### 5.R.R2
1/1 point (graded)

Next, plot the data using matplot(Xy,type="l"). Which of the following do you 
think is most likely given what you see?

- [ ] Our estimate of s.e.(β<sub>1</sub>) is too high.
- [x] Our estimate of s.e.(β<sub>1</sub>) is too low. correct
- [ ] Our estimate of s.e.(β<sub>1</sub>) is about right.

Explanation:

There is very strong autocorrelation between consecutive rows of the data matrix. 
Roughly speaking, we have about 10-20 repeats of every data point, so the sample 
size is in effect much smaller than the number of rows (1000 in this case).
Submit Some problems have options such as save, reset, hints, or show answer. 
These options follow the Submit button.


### 5.R.R3
1/1 point (graded)

Now, use the (standard) bootstrap to estimate s.e.(β<sub>1</sub>). To within 
10%, what do you get?
 
0.0274
 
Explanation:

When we do the i.i.d. bootstrap, we are relying on the original sampling having 
been i.i.d. That is the same assumption that screwed us up when we used lm.
Submit Some problems have options such as save, reset, hints, or show answer. 
These options follow the Submit button.

### 5.R.R4
1/1 point (graded)

Finally, use the block bootstrap to estimate s.e.(β<sub>1</sub>). Use blocks of 
100 contiguous observations, and resample ten whole blocks with replacement then 
paste them together to construct each bootstrap time series. For example, one 
of your bootstrap resamples could be:

```{r}
new.rows = c(101:200, 401:500, 101:200, 901:1000, 301:400, 1:100, 1:100, 801:900, 201:300, 701:800)

new.Xy = Xy[new.rows, ]
```

To within 10%, what do you get?

0.2

Explanation:

The block bootstrap does a better job of mimicking the original sampling 
procedure, because it preserves the autocorrelation.