# Antonio Pelayo
## Quiz 21 4.7 Gaussian Discriminant Analysis - Many Variables
### 4.7.R1
1/1 point (graded)

pg 34:

Why does Total Error keep going down on the graph on page 34 of the notes, even 
though the False Negative Rate increases?

- [ ] The False Negative Rate does not affect Total Error.
- [ ] A higher False Negative Rate generally decreases Total Error.
- [x] Positive responses are so uncommon that their impact on the Total Error is small. correct
- [ ] All of the above

Explanation:

The Total Error is a weighted average of the False Positive Rate and False 
Negative Rate. The weights are determined by the Prior Probabilities of 
Positive and Negative Responses. Although the False Negative Rate might be high, 
the prior for positive responses is very small.