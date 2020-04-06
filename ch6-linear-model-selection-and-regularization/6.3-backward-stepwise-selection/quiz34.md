# Antonio Pelayo
## Quiz 34 backward stepwise selection 
### 6.3.R1
1/1 point (graded)

You are trying to fit a model and are given p=30 predictor variables to choose 
from. Ultimately, you want your model to be interpretable, so you decide to use
Best Subset Selection.

How many different models will you end up considering?
 
2<sup>30</sup>
 
Explanation:

Each predictor can either be included or not included in the model. That means 
that for each of the 30 variables there are two options. Thus, there are 2^30 
potential models.

Note: Don’t ever try to fit that many models! It is too many and that is why 
Best Subset Selection is rarely used in practice for say p=10 or larger.
Submit Some problems have options such as save, reset, hints, or show answer. 
These options follow the Submit button.


### 6.3.R2
1/1 point (graded)

How many would you fit using Forward Selection?:

1+30*(30+1)/2
 
Explanation:

For Forward Selection, you fit (p-k) models for each k=0,...p-1. The expression 
for the total number of models fit is on pg 15 of the notes: p(p+1)/2+1.