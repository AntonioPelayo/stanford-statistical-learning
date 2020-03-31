# Antonio Pelayo
## Quiz 25 5.1 Cross-validation
### 5.1.R1
1/1 point (graded)

When we fit a model to data, which is typically larger?

- [x] Test Error
- [ ] Training Error

Explanation:

Training error almost always underestimates test error, sometimes dramatically
Submit Some problems have options such as save, reset, hints, or show answer. 
These options follow the Submit button.


### 5.1.R2
1/1 point (graded)

What are reasons why test error could be LESS than training error?


- [x] By chance, the test set has easier cases than the training set. correct
- [ ] The model is highly complex, so training error systematically overestimates test error
- [ ] The model is not very complex, so training error systematically overestimates test error

Explanation:

Training error usually UNDERestimates test error when the model is very complex 
(compared to the training set size), and is a pretty good estimate when the 
model is not very complex. However, it's always possible we just get too few 
hard-to-predict points in the test set, or too many in the training set.