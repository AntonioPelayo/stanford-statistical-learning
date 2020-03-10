# Quiz 12 Antonio Pelayo March 9, 2020
## 3.5 Review Questions
### 3.5.R1
1/1 point (graded)

According to the model for sales vs TV interacted with radio, what is the effect 
of an additional $1 of radio advertising if TV=$50? (with 4 decimal accuracy)
```
> def sales(B0, B1, B2, B3, radio, tv):
    return B0 + ((B1 + (B3 * radio)) * tv) + (B2 * radio)

> B0 = 6.7502
> B1 = 0.0191
> B2 = 0.0289
> B3 = 0.0011
> radio1 = 0
> radio2 = 1
> tv1 = 50
> tv2 = 250

> print(sales(B0, B1, B2, B3, radio2, tv1) - sales(B0, B1, B2, B3, radio1, tv1))
0.08389999999999986
```
.0839


### 3.5.R2
1/1 point (graded)

What if TV=$250? (with 4 decimal accuracy)
```
> print(sales(B0, B1, B2, B3, radio2, tv2) - sales(B0, B1, B2, B3, radio1, tv2))
0.3039000000000005
```  
.3039
 
Explanation
The effect of an additional unit of radio is .0289 plus .0011 times TV.
