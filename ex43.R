# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse and readxl packages
library(tidyverse)
library(readxl)
#     c) Run the soloution code of ex42 to import and transform the data for this exercise
source("./exercise-solutions/ex42.R")
##
##
##
# 1.  Display the observations in d1 from Austria
filter(d1,name=="Austria")
# 2.  Display the distinct observations in d1 of each area name and code (241 rows)
distinct(d1,name,code)

# 3.  Display the observations in d1 using pipes (%>%)
#     a) from Austria
#     b) the name, year and odr variables only
d1%>%
  filter(name =="Austria")%>%
  select(-code)

# 4.  Display the observations in d2 using pipes
#     a) from Philippines in 2015
#     b) the name, age and pop variables only
d2%>%
  filter(name =="Philippines",year=="2015")%>%
  select(name, age, pop)

# 5.  Display the observations in d2 using pipes
#     a) from Australia in 2000 over 65
#     b) the name, age and pop variables only
d2%>%
  filter(name =="Australia",year=="2000", age>65)%>%
  select(name, age, pop)

# 6.  Display the observations in d3 using pipes
#     a) from Asian countries and issues on Policy on growth
#     b) the name and policy variables only
d3 %>%
  filter(region =="Asia",issue=="Policy on growth ")%>%
  select(name, policy)


# 7.  Modify d4 to the major areas and at age 90+
#     (Hint: major areas are the rows where middle_name observations are missing) 
d4 <- filter(d4, is.na(middle_name),age>90)

# 8.  Display the observations in d4 using pipes
#     a) the age group 90+
#     b) the name and pop variables only
#     c) the top 5 largest age 90+ populations
d4%>%
    filter(age>90)%>%
  select(name, pop)%>%
top_n(5, pop)



# 9.  Display the observations in d5 using pipes
#     a) from the regional level where the code is 2 characters longs)
#        (Hint: use the nchar() function to return the number of characters in a the code variable
#     b) from two people households
#     c) the name and people variables only
d5%>%
  filter(size=="two",nchar(code) == 2)%>%
  select(name, people)




