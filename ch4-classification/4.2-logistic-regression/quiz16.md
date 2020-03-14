# Quiz 16 Antonio Pelayo March 14, 2020
## 4.2 Logistic Regression Quiz
### 4.2.R1
1/1 point (graded)

Using the model on page 8 of the notes (134 in text), what value of Balance
will give a predicted Default rate of 50%? (within 3 units of accuracy)

Enter the value of Balance below:
```
> balance = function(Pdefault){
+   return((log(Pdefault/(1-Pdefault)) + 10.6513) / 0.0055)
+ }
> balance(0.5)
[1] 1936.60
```

Explanation:

We know that logit(.5) = β<sub>0</sub> + β<sub>1</sub> * Balance. 

Thus:

Balance = (logit(.5) - β<sub>0</sub>) / β<sub>1</sub> 

= [log(.5/(1-.5)) + 10.6513] / .0055 

= 1936.6