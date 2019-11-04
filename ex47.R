# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse packages
library(tidyverse)
#     c) Run the soloution code of ex45 to import and transform the data for this exercise
source("./exercise-solutions/ex45.R")
##
##
##
# 1. View d6
head(d6)

# 2. Create a new data set d8 that is a copy of d1, with only the code, year and odr variables
d8<-d1%>%
  select(code, year,odr)
# d8
# 3. Join the old age dependncy ratio obseravtions in d8 to the the corresponding countries and years in d6. Save as d9
d9<-left_join(d6,d8,by=c("year"="year"))

# d9
# 4. From the wpp.xlsx data.
#    a) read in the 1st sheet on total fertility rate and call it j1
#    b) read in the 2nd sheet on infant mortality rates and call it j2
#    c) read in the 3rd sheet on life expectancy and call it j3
#    d) read in the 4th sheet on net migration and call it j4
  
j1<-read_excel("./exercise-data/wpp.xlsx", sheet = 1)
j2<-read_excel("./exercise-data/wpp.xlsx", sheet = 2)
j3<-read_excel("./exercise-data/wpp.xlsx", sheet = 3)
j4<-read_excel("./exercise-data/wpp.xlsx", sheet = 4)


#    e) view the data
j1; j2; j3; j4
# 5. Create a new data set j5 from j1 using pipes that joins together j1, j2, j3 and j4  

j5<-j1%>%
    left_join(j2)%>%
    left_join(j3)%>%
    left_join(j4)



# j5
# 6. Create a new data set j6 using pipes to separate the period column so that
#    a) two new columns for the first and last year in each period are created
#    b) the original period column is not removed 
#    c) the new columns are integer values
#    and then 
#    d) the name column is dropped
j6<-j5%>%
    separate(col=period, into=c("first_year","last_year"),remove = FALSE, convert = TRUE)%>%
    select(-name)


# j6
# 8. Create a new data set d0 from d3 that contains only 
#    a) observations on the Policy on growth issue
#    b) renames policy to growth_policy_2015
#    c) the name, code, region and growth_policy_2015 variables only
d0<-d3%>%
  filter(issue=="Policy on growth")%>%
  rename(growth_policy_2015=policy)%>%
  select(name, code, region, growth_policy_2015)



# d0
# 9. Create a new data set j7 that joins the population growth policy and region obseravtions in d0 to 
#    the demographic data in j6 the corresponding countries
j7<-j6%>%
    left_join(d0)

j7<-left_join(d0,j6)

# j7