## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA)
knitr::knit_hooks$set(purl = hook_purl)

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  R version 3.5.0 (2018-04-23) -- "Joy in Playing"
#  Copyright (C) 2018 The R Foundation for Statistical Computing
#  Platform: x86_64-w64-mingw32/x64 (64-bit)
#  
#  R is free software and comes with ABSOLUTELY NO WARRANTY.
#  You are welcome to redistribute it under certain conditions.
#  Type 'license()' or 'licence()' for distribution details.
#  
#  R is a collaborative project with many contributors.
#  Type 'contributors()' for more information and
#  'citation()' on how to cite R or R packages in publications.
#  
#  Type 'demo()' for some demos, 'help()' for on-line help, or
#  'help.start()' for an HTML browser interface to help.
#  Type 'q()' to quit R.
#  >

## ------------------------------------------------------------------------
1 + 2

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > 1 +
#    +

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > 1 +
#    + 2
#   [1] 3

## ------------------------------------------------------------------------
7 / (1 + 3
 )
"Guy
"

## ------------------------------------------------------------------------
7 / (1 + 3)

## ------------------------------------------------------------------------
7 / 1 + 3

## ------------------------------------------------------------------------
"Guy"
'Guy'

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > Guy
#  Error: object 'Guy' not found

## ------------------------------------------------------------------------
1 + 2 + 3 # Here R does some serious Maths

## ------------------------------------------------------------------------
1 + 2 # + 20

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > 1 + # 2
#    +

## ------------------------------------------------------------------------
1 + 2

# same as
1     +            2

## ------------------------------------------------------------------------
print("Strings  obey  spacing.")
print(" Strings    obey         spacing   .    ")

## ------------------------------------------------------------------------
"Guy"

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > 1 + 2   5 * 9
#  Error: unexpected numeric constant in " 1 + 2   5"

## ------------------------------------------------------------------------
 1 + 2; 5 * 9

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex11.R')----
#  # 1. 5 plus 6
#  
#  # 2. 2 multiplied by 8
#  
#  # 3. 8 divided by 3
#  
#  # 4. 909 minus 506
#  
#  # 5. 5 to the power of 10
#  
#  # 6. Tell R to say your first name
#  
#  # 7. Q: Which symbol does R use to ignore all code after?
#  #    A:
#  # 8. On one line of code with two R print commands write
#  #    your first and last name.
#  

## ---- eval=FALSE, prompt=FALSE-------------------------------------------
#  function(argument1, argument2)

## ---- eval=FALSE---------------------------------------------------------
#  ?log

## ------------------------------------------------------------------------
log(x = 10)
# same as 
log(x = 10, base = exp(1))
# change the base argument...
log(x = 10, base = 10)

## ------------------------------------------------------------------------
log(x = 10)
# same as
log(10)

# knows the order as well (i.e. second input is the `base`)
log(10, 10)
# same as
log(x = 10, base = 10)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex12.R')----
#  # 1. Natural logarithm of 5
#  
#  # 2. Square root of 121
#  
#  # 3. Absolute value of 10 and -11
#  
#  # 4. 8 x 7 x 6 x 5 x 4 x 3 x 2 x 1 (the factorial of 8)
#  
#  # 5. Round pi (3.141593) to 3 decimal places
#  
#  # 6. The lograithm of 100 to the base 10
#  
#  # 7. The exponential of 4
#  
#  # 8. Print your name using the message function
#  

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex13.R')----
#  # 1. Test if 3 is larger than pi
#  
#  # 2. Test if pi is equal to 3.141593
#  
#  # 3. Test if 7 divided by 3 is less than or equal to 3
#  
#  # 4. Test if 5 times 2 is greater than or equal to 10
#  
#  # 5. Test if 1 plus 5 is not equal to 7
#  
#  # 6. Test if logarithm of 1000 is larger 7
#  
#  # 7. Test if pi is greater than 3 and 4
#  
#  # 8. Test if pi is less than  3 or 4

## ------------------------------------------------------------------------
1 + 2

## ------------------------------------------------------------------------
a  <- 1 + 2

## ------------------------------------------------------------------------
a

## ------------------------------------------------------------------------
a

## ------------------------------------------------------------------------
exp
exp <- 1 + 3
exp

## ------------------------------------------------------------------------
base::exp

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > A
#  Error: object 'A' not found

## ---- error=TRUE---------------------------------------------------------
a

## ---- error=TRUE---------------------------------------------------------
e

## ------------------------------------------------------------------------
a
a * 2

b  <- a * sqrt(a)
b

## ------------------------------------------------------------------------
ls()

## ------------------------------------------------------------------------
rm(b, exp)
ls()

## ------------------------------------------------------------------------
rm(list = ls())

## ------------------------------------------------------------------------
v1  <- c(1,2,3,4,5,6,7,8,9,10)

## ------------------------------------------------------------------------
v2  <- c("a", "b", "c", "d")
v2

## ------------------------------------------------------------------------
# will convert everything to characters if there is at least one
v3  <- c(1, "two", 3, 4)
v3

## ------------------------------------------------------------------------
v4  <- c(v1 , v2 , v1)
v4

## ------------------------------------------------------------------------
1:20
# backwards
10:-5

## ------------------------------------------------------------------------
seq(from = 0, to = 10) 
# the 'by' argument let's you set the increments
seq(from = 0, to = 10, by = 2) 

## ------------------------------------------------------------------------
# the length.out argument specifies the 
# length of the vector and R figures out 
# the increments itself
seq(from = 0, to = 10, length.out = 25) 

## ------------------------------------------------------------------------
rep(x = 0, times = 10)
# as always you can drop the argument name
rep(x = "Hello", times = 3) 
# repeating vec 1 twice
rep(x = v1 , times = 2) 
# we can repeat each element as well
rep(x = v2 , each = 2) 

## ------------------------------------------------------------------------
v1 + v1
v1 ^ 2
log(x = v1)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex14.R')----
#  # 1. Create a vector called a1 for the 1, 4, 9, 16, 25
#  
#  # 2. Create a vector called a2 from 1 to 100
#  
#  # 3. Create a vector called a3 from -8 to 20 in steps of 4
#  
#  # 4. Create a vector called a4 that combines a1 and a3
#  
#  # 5. Create a vector called a5 that has your first and last name repeated 3 times
#  
#  # 6. Find the square root of each element in a1
#  
#  # 7. Test to see where a3 are positive (greater than zero)
#  
#  # 8. Divide a2 by a1. Then divide a2 by a3. What is going on?

## ------------------------------------------------------------------------
# logical test
v1 > 5

# display a character vector for results
ifelse(test = v1 > 8, yes = "Low", no = "High")

# can return numeric values as well
ifelse(test = v1 > 8, yes = 0, no = 1)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex15.R')----
#  # 1. Find the sum of all elements in a1
#  
#  # 2. What is the largest element in a4
#  
#  # 3. Multiply all elements of a2 together
#  
#  # 4. How many elements are there in a5
#  
#  # 5. Reverse the order of a2
#  
#  # 6. Which elements of a1 are greater than 10
#  
#  # 7. What is the range of values in a4
#  
#  # 8. What are the unique elements of a4
#  
#  # 9. Sort the values in a4
#  
#  # 10. Create a tabultion of the elements in a4
#  

## ------------------------------------------------------------------------
v1
sample(x = v1, size = 5)
sample(x = v1, size = 15, replace = TRUE)

## ------------------------------------------------------------------------
# normal
rnorm(n = 5, mean = 1, sd = 2)
# binomial
rbinom(n = 8, size = 10, prob = 0.3)
# poisson
rpois(n = 8, lambda = 2)
# uniform
runif(n = 5, min = 5, max = 8)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex16.R')----
#  # 1. Create a vector a6 that is a sequence from 1 to 25 of length 8
#  
#  # 2. What is the mean of a6
#  
#  # 3. what is the standard deviation of a6
#  
#  # 4. Create a vector a7 that is a random sample of size 8 from a2
#  
#  # 5. What is the correlation of a6 and a7
#  
#  # 6. Create a vector a8 of length 8 of random numbers from a normal
#  #    distribution with mean 10 and standard deviation 2
#  
#  # 7. What is Inter Quartile Range of a8
#  
#  # 8. Create a summary of a8
#  

## ------------------------------------------------------------------------
pi
LETTERS

## ------------------------------------------------------------------------
matrix(data = 1:12, nrow = 4)

## ------------------------------------------------------------------------
list(LETTERS, 1:10, matrix(1:6, nrow = 2))

## ------------------------------------------------------------------------
swiss

## ------------------------------------------------------------------------
v4 <- c("I", "really", "like", "chocolate", "ice cream.")
# with the bracket we reference the third element
v4[3] 
# we can  reference a sequence of elements
v4[2:4] 
# or any elements we like
v4[c(1,3,4)] 

## ------------------------------------------------------------------------
# all except the 2nd element
v4[-2] 
# and we can change elements
v4[4]  <- "strawberry" 
v4

## ------------------------------------------------------------------------
# create a matrix
m0 <- matrix(data = 1:12, nrow = 3)
m0
# bottom right element
m0[3, 4]
# third column
m0[, 3]

## ------------------------------------------------------------------------
# can use the raw row and column coordinates
swiss[38,1]
# the row and column names
swiss["Sion","Fertility"]
# the column name and row coordinates
# this is useful if there are no row names, which can often be the case.
swiss$Fertility[38]
# the whole column
swiss$Fertility

## ------------------------------------------------------------------------
v5  <- c(10, 7, NA, NA, 0, NA, -2, 8)
v5
# this won't work by default
max(v5) 
# there is usually an option to allow functions to omit NA
max(v5, na.rm = TRUE)
# test for missing values using is.na
is.na(v5)
# test for non missing values using !is.na
!is.na(v5)
# this works (does not have na.rm argument)
summary(v5) 

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex17.R')----
#  # 1. Print out the second row of the m1 matrix, where
#  # m1 <- matrix(1:28, nrow = 4, ncol = 7)
#  
#  # 2. Print out the top right value of the m1 matrix
#  
#  # 3. Print out the first column of the m1 matrix
#  
#  # 4. Print out the whole of the Infant.Mortality column in the swiss data
#  
#  # 5. What is the maximum fertility in the swiss data
#  
#  # 6. Print out the Catholic value for Glane in the swiss data
#  
#  # 7. Set the thrid and sixth element of a8 to missing values
#  
#  # 8. What is the variance of the remaining numbers in a8

## ---- eval=FALSE, prompt=FALSE-------------------------------------------
#  function(arguments, ...){
#    actions
#    return(value)
#  }

## ------------------------------------------------------------------------
my_square <- function(x = NULL){
  y <- x ^ 2
  return(y)
}
my_square(x = 2)
my_square(x = 10)

# add a p argument to raise x to any power
my_power <- function(x = NULL, p = 2){
  y <- x ^ p
  return(y)
}
my_power(x = 2)
my_power(x = 2, p = 4)

## ------------------------------------------------------------------------
my_square <- function(x = NULL){
  y <- x ^ 2
  return(y)
}
my_square(x = 2)
my_square(x = 10)

# add a p argument to raise x to any power
my_power <- function(x = NULL, p = 2){
  y <- x ^ p
  return(y)
}
my_power(x = 2)
my_power(x = 2, p = 4)

## ---- eval = FALSE, prompt = FALSE---------------------------------------
#  for(element in vector){
#    action
#  }

## ------------------------------------------------------------------------
# create empty vector to save action
v8 <- rep(NA, times = 12)
v8

# fill the vector with random numbers from a poisson distribution
# with increasing lambda mean based on i value
for(i in 1:10){
  x <- rpois(n = 1, lambda = i)
  message(x)
  v8[i] <- x
}
v8

## ---- eval = FALSE-------------------------------------------------------
#  for(i in 1:10){
#    # read in different excel sheets
#    d <- read_excel(path = "myexcelfile.xlsx", sheet = i)
#    # run regression models using data from excel sheet
#    m <- lm(formula = y ~ x1 + x2, data = d)
#    # save regression model coefficients
#    write_csv(x = m$coefficients, path = paste0("model", i, ".csv"))
#  }

## ------------------------------------------------------------------------
# initial population of 100 and growth rate of five percent per year
p <- rep(NA, times = 10)
p[1] <- 100
for(i in 1:9){
  p[i+1] <- p[i] * (1 + 0.05)
}
p

## ------------------------------------------------------------------------
# can wrap for loops in a function
sp_rate <- function(p0 = NULL, r = NULL, n = NULL){
  p <- p0
  for(i in 1:n){
    p[i+1] <- p[i] * (1 + r)
  }
  return(p)
}
sp_rate(p0 = 100, r = 0.05, n = 5)
sp_rate(p0 = 20, r = 0.1, n = 20)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex18.R')----
#  # 1. Create a function called my_name with inputs
#  #    a) name
#  #    b) n
#  #    that prints your name n times
#  ##### <- function(name, n){
#    rep(x = #####, times = #####)
#  }
#  # 2. Run your function with your name and n = 10
#  
#  # 3. Create a function called rpois_add with inputs
#  #    a) n
#  #    b) lambda1
#  #    c) lambda2
#  #    that adds together n random numbers from poisson distrubions with mean lambda1 and lambda2
#  rpois_add <- #####(n, #####, lambda2){
#    ##### <- rpois(n = #####, lambda = lambda1)
#    r2 <- rpois(n = n, ##### = lambda2)
#    #####(r1 + #####)
#  }
#  # 4. Run your function with n = 20, lambda1 = 5, lambda2 = 8
#  
#  # 5. Create a function called called gage with inputs
#  #    a) x with default of 15:55
#  #    b) c with default of 12 * w^-4
#  #    that calcuates the Gage fertility age schedule using the formula
#  #    c * (x - s) * (s + w - x)^2
#  #    where c is a constant value
#  #          x are mother ages
#  #          s is the minimum mothers age
#  #          w is the width of the mothers age (Hint: max(x) - min(x))
#  ##### <- function(x = #####:#####, ##### = 12 * #####^-4){
#    s <- min(x)
#    w <- max(x) - min(x)
#    y <- ##### * (x - #####) * (s + ##### - x)^#####
#    return(#####)
#  }
#  # 6. Run your function and save results as
#  #    a) y1 with all values set to default
#  #    b) y2 with x set to 15:60 and c to 1/400000
#  
#  
#  # 7. Uncomment the code below for a simple plot of the results
#  # plot(y1)
#  # lines(y2)
#  
#  

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  > getwd()
#  "C:/Users/Guy/Dropbox/Teaching"

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  # read data from data folder
#  > d0 <- read_csv("./data/mydata.csv")
#  # read data using full path
#  > d0 <- read_csv("E:/Teaching/data/mydata.csv")
#  # same as
#  > d0 <- read_csv("E:\\Teaching\\data\\mydata.csv")
#  # will not work
#  > d0 <- read_csv("E:\Teaching\data\mydata.csv")
#  Error: '\T' is an unrecognized escape in character string starting ""E:\T"

## ------------------------------------------------------------------------
# remove all objecst
rm(list = ls())
# run code in ex19.R using full path:
source(file= "C:/Users/Guy/Dropbox/DS4D2018/exercise-solutions/ex18.R")
# if file is within project folder can run using a relative path
# source(file = "./exercise-solutions/ex18.R")
ls()

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("tidyverse")
#  install.packages("openxlsx")

