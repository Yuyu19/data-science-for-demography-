# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse and readxl packages
library(tidyverse)
library(readxl)
#     c) Run the code in ex41_prelim.R to import the data for this exercise
source("./exercise/ex41_prelim.R")
# 1. Take a look at d1, which comes from the ESTIMATES sheet of WPP2015_POP_F13_A_OLD_AGE_DEPENDENCY_RATIO_1564.xls

#    a) Q: What are the values for when we tidy the data?
#       A: old age dependency ratios
#    b) Q: What are the key variables for when we tidy the data?
#       A: years
#    c) Modify d1 to 
#       i) a tidy format with dimensions 3,374 x 4 
#       ii) with the key variable converted to a suitable mode
d1<-gather(data=d1,key=years,value="old age dependency ratios",3:16)
# 2. Take a look at d2, which comes from the ESTIMATES sheet of WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls

#    a) Q: What are the values for when we tidy the data?
#       A: population counts by age
#    b) Q: What are the key variables for when we tidy the data?
#       A: age groups
#    c) Get the data into a tidy format with dimensions 74,228 x 5.
d2<-gather(data=d2, key=age_group, value=population_counts_by_age,4:25)
# 3. Take a look at d3 and 2015_WPPDataset_AllVariables.xls

#    a) Q: What are the values for when we tidy the data?
#       A: population policies
#    b) Q: What are the key variables for when we tidy the data?
#       A: population issues
#    c) Get the data into a tidy format with dimensions 4,755 x 5. 
d3<-gather(data=d3, key=population_issues, value=population_policies,4:26)

# 4. Take a look at d4 and the `Mid-2015 Persons` sheet of SAPE18DT14.xls

#    a) Q: What are the values for when we tidy the data?
#       A: population counts by age
#    b) Q: What are the key variables for when we tidy the data?
#       A: age groups
#    c) Get the data into a tidy format with dimensions 143,431 x 5.
d4<-gather(data=d4, key=age_groups, value=population_counts_by_age,4:22)

# 5. Take a look at d5 and the tabell.csv

#     a) Q: What are the values for when we tidy the data?
#        A: population counts by household size
#     b) Q: What are the key variables for when we tidy the data?
#        A: size of households
#     c) Get the data into a tidy format with dimensions 2,200 x 3. Save as d6

d6<-gather(data=d5, key=size_of_households, value=population_counts_by_household_size,-area)
# 6. Spread d6 to have rows corresponding to the family size (i.e 5 rows) and columns 
#    corresponding to the areas (441 columns)
d6<-
  spread(data = d6,key = area,value = population_counts_by_household_size)
