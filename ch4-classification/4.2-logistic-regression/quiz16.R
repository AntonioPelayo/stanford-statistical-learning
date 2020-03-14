pHat = function(B0, B1, balance){
  numerator = exp(B0 + (B1 * balance))
  denominator = 1 + numerator
  
  return(numerator / denominator)
}
balance = function(Pdefault, B0, B1){
  return((log(Pdefault / (1-Pdefault)) - B0) / B1)
}

pHat(-10.6513, 0.0055, 2000)    # Balance of 2000 is a bit high
balance(0.5, -10.6513, 0.0055)  # Calculate balance for 50% default
