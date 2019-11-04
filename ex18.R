# 1. Create a function called my_name with inputs
#    a) name      
#    b) n 
#    that prints your name n times
##### <- function(name, n){
  rep(x = #####, times = #####)
}
# 2. Run your function with your name and n = 10

# 3. Create a function called rpois_add with inputs
#    a) n      
#    b) lambda1
#    c) lambda2
#    that adds together n random numbers from poisson distrubions with mean lambda1 and lambda2
rpois_add <- #####(n, #####, lambda2){
  ##### <- rpois(n = #####, lambda = lambda1)
  r2 <- rpois(n = n, ##### = lambda2)
  #####(r1 + #####)
}
# 4. Run your function with n = 20, lambda1 = 5, lambda2 = 8

# 5. Create a function called called gage with inputs
#    a) x with default of 15:55 
#    b) c with default of 12 * w^-4
#    that calcuates the Gage fertility age schedule using the formula
#    c * (x - s) * (s + w - x)^2
#    where c is a constant value
#          x are mother ages
#          s is the minimum mothers age
#          w is the width of the mothers age (Hint: max(x) - min(x))
##### <- function(x = #####:#####, ##### = 12 * #####^-4){
  s <- min(x)
  w <- max(x) - min(x)
  y <- ##### * (x - #####) * (s + ##### - x)^#####
  return(#####)
}
# 6. Run your function and save results as
#    a) y1 with all values set to default
#    b) y2 with x set to 15:60 and c to 1/400000


# 7. Uncomment the code below for a simple plot of the results
# plot(y1)
# lines(y2)
  

