# Antonio Pelayo
## Quiz 23 4.R Classification in R
### 4.R.R1
1/1 point (graded)

In ch4.R, line 13 is "attach(Smarket)." If that line was omitted from the script, 
which of the following lines would cause an error?:

- [x] line 15: mean(glm.pred==Direction) correct
- [ ] line 18: glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial, subset=train)
- [ ] line 22: Direction.2005=Smarket$Direction[!train]
- [ ] line 30: table(glm.pred,Direction.2005)

Explanation:

attach() allows a user to access the columns of a data.frame directly. In this 
case, line 15 uses "Direction" instead of "Smarket$Direction".