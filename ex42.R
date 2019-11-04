# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse and readxl packages
library(tidyverse)
library(readxl)
#     c) Run the code in ex42_prelim.R to import the data for this exercise
source("./exercise/ex42_prelim.R")
##
##
##
# 1.  Modify d2 to drop the rows with missing values
d2<-drop_na(d2,)
# 2.  Modify d2 to separate the age column so that
#     a) two new columns for the first and last age in each group are created
#     b) the original age column is not removed 
#     c) the new columns are integer values
d2<-separate(data=d2,age, into=c("first","last"),remove=FALSE,convert = TRUE)
# 3.  Modify d3 to drop the rows with missing values
d3<-drop_na(d3,)

# 4.  Uncomment the following code to save the immigration policy rationale data base in d3
d3_imm <- d3 %>% 
   filter(issue == "Rationale for current immigration policy") %>%
  select(name, issue, policy)
 d3_imm
# 5.  a) Modify d3_imm using the separate_rows() function to create new rows for each policies that are comma delimited
#     (Hint: use sep = "," and the final data frame should be 393 rows)
#     b) Modify d3 using seperate_rows() to create a data frame with 7,796 rows

 d3<-separate_rows(d3_imm,policy, sep=",")
# 6.  Modify d4 using the fill() function to replace the NA values in the name column

 d4<-fill(d4,name)
 
# 7.  Modify d4 to separate the age column so that
#     a) two new columns for the first and last age in each group are created
#     b) the original age column is not removed 
#     c) the new columns are integer values

 d4<- separate(d4,age,into=c("first","last"),remove=FALSE,convert = TRUE)
# 8.  Modify d4 to replace the na in last with 120
replace_na(d4,replace=list(last=120))
# 9.  Modify d5 to drop the rows with missing values
d5<-drop_na(d5,)
# 10. Modify d5 using the code template below to separate the area column so that 
#     two new columns for the code and name in each group are created
#     (Hint: Replace the #### parts)
d5 <- separate(d5, col = area,into = c("code", "name"), 
               sep = "[:blank:]", fill = "right", extra = "merge") 


