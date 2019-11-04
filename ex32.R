# 0.  a) Check your working directory is in the course folder. Load SHU2018-3XS371026.Rproj file if not.
getwd()
#     b) Load the tidyverse package (that includes the readr package)
library(tidyverse)
#     c) Run the code in ex32_prelim.R to import the data for this exercise
source("./exercise/ex32_prelim.R")
##
##
##
# 1.  What are the dimensions of d1 data frame object
dim(d1)
# 2.  Show a summary of each column of d1
summary(d1)
# 3.  Show the first three rows of d1
#     (Hint: Use head() function. See ?head to set the number of rows)
?head
head(d1,n=3L)

# 4.  Show the column names of d1
colnames(d1)

# 5.  Convert the `name` column in d5 from a character string to a factor
as.factor(d5$name)

# 6.  Show the levels of Origin column
head(d5)
levels(d5$name)

# 7.  Reverse the order of the levels for the name column in d5
d5$name<-as.factor(d5$name)
d5$name<-fct_rev(d5$name)

# 8.  Check the order of the new levels
levels(d5$name)


# 9.  Reorder the levels of the name column in d5 so that Berlin is the first category. 
#     (Hint: You only need to type the name of the first category when defining the new order)
?fct_reorder
d5$name<- fct_relevel(d5$name,"Berlin","Bayern" )
# 10.  Check the order of the new levels
