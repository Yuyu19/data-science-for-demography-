# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse and readxl packages
library(tidyverse)
library(readxl)
##
##
##
# 1. Using WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls on future population sizes, read into R
#    a) the 1st sheet and save as r1
#    b) the 2st sheet and save as r2
#    c) print r1
#    d) print r2
r1 <- read_excel("./exercise-data/WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx", 
                 sheet = 1, skip = 16)
r2 <- read_excel("./exercise-data/WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx", 
                 sheet = 2, skip = 16)
r1
r2
head(r1)
# 2. Bind the rows of r1 and r2 and call the result r3
r3<-bind_rows(r1,r2)
# 3. a) Q: How many rows in r1
#       A: 3,374
#    b) Q: How many rows in r2
#       A: 4,338
#    b) Q: How many rows in r3
#       A: 7,712

# 4. Complete the following for loop to read all nine sheets of the
#    WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx speadsheet and 
#    bind the rows into one data frame called r4
#    (Hint: Replace the ####)
r4 <- NULL
for(i in 1:9){
  r0 <- read_excel(path = "./exercise-data/WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx", 
                   skip = 16, sheet = i) %>%
    select(-Index, -Notes) %>%
   rename(name = "Region, subregion, country or area *",
           code = "Country code",
           year = "Reference date (as of 1 July)",
           type = Variant)
  r4 <- bind_rows(r4, r0)
  print(nrow(r4))
}
r4
# 5. a) Q: How many rows in r4
#       A: 38,078
# 6. Display the observations in r4 using pipes
#    a) from China in 2100
#    b) the type and `80-84` column only

r4%>%
  filter(name%in%"China",year==2100)%>%
  select(type,`80-84`)
