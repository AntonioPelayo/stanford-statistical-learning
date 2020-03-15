# Quiz 17 
# 4.3.R1
ProbAinClass = function(B0, B1, B2, X1, X2){
  # X_1 = Hours studies
  # X_2 = Undergrad GPA
  # Return probablility student recieves an A
  numerator = exp(B0 + (B1 * X1) + (B2 * X2))
  return(numerator / (1 + numerator))
}

hoursToStudy = function(Px,B0, B1, B2, X2){
  return((log(Px / (1-Px)) - B0 - (B2 * X2)) / B1)
}

ProbAinClass(-6, 0.05, 1, 40, 3.5)
hoursToStudy(.5, -6, 0.05, 1, 3.5)
