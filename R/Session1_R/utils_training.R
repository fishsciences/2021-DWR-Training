# training utilities script for DWR, 2021-10-20 training

len = function(x) {length(unique(x))}

# function to calculate fish condition
condition = function(weights, lengths) {
  if(any(lengths == 0 | weights == 0)) stop("some value(s) are 0")
  num = 1e5*weights
  den = lengths^3
  K = num/den
  return(K)
}
