## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA)
knitr::knit_hooks$set(purl = hook_purl)

## ------------------------------------------------------------------------
library(tidyverse)

## ---- echo=FALSE, eval=FALSE---------------------------------------------
#  # print table4a (loaded with tidyr package)
#  table4a
#  # reshape
#  gather(table4a, key = "year", value = "cases", `1999`, `2000`)
#  
#  # print table2 (loaded with tidyr package)
#  table2
#  # reshape
#  spread(table2, key = type, value = count)

## ----set-options, echo=FALSE, cache=FALSE-----------------------------------------
options(width = 84)

## ----eval=FALSE, prompt=FALSE-----------------------------------------------------
#  file.show("./data/WPP2015_FERT_F04_TOTAL_FERTILITY.xls")

## ---- message=FALSE---------------------------------------------------------------
library(readxl)
#read in the data and tidy up (more later on %>%, rename filter and select)
df1 <- read_excel("./data/WPP2015_FERT_F04_TOTAL_FERTILITY.xls",
                  sheet = "ESTIMATES", skip = 16) %>%
  rename(name = "Major area, region, country or area *",
         code = "Country code") %>%
  filter(!(Notes %in% letters), code != 948) %>%
  select(-Index, -Notes, -Variant)

## ---------------------------------------------------------------------------------
df1

## ---------------------------------------------------------------------------------
library(tidyverse)
# reshape
df2 <- gather(data = df1, key = period, value = tfr, 3:15)
df2

## ---- eval=FALSE------------------------------------------------------------------
#  # from column `1950-1955` to column `2010-2015` (and every column inbetween)
#  df2 <- gather(data = df1, key = period, value = tfr, `1950-1955`:`2010-2015`)
#  # columns containing "-" in their name
#  df2 <- gather(data = df1, key = period, value = tfr, contains("-"))
#  # without the name and code columns
#  df2 <- gather(data = df1, key = period, value = tfr, -name, -code)
#  # without the columns from name to column code (and every column inbetween)
#  df2 <- gather(data = df1, key = period, value = tfr, -(name:code))

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex41.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  getwd()
#  #     b) Load the tidyverse and readxl packages
#  
#  
#  #     c) Run the code in ex41_prelim.R to import the data for this exercise
#  
#  # 1. Take a look at d1, which comes from the ESTIMATES sheet of WPP2015_POP_F13_A_OLD_AGE_DEPENDENCY_RATIO_1564.xls
#  d1
#  #    a) Q: What are the values for when we tidy the data?
#  #       A: old age dependency ratios
#  #    b) Q: What are the key variables for when we tidy the data?
#  #       A: years
#  #    c) Modify d1 to
#  #       i) a tidy format with dimensions 3,374 x 4
#  #       ii) with the key variable converted to a suitable mode
#  
#  # 2. Take a look at d2, which comes from the ESTIMATES sheet of WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls
#  
#  #    a) Q: What are the values for when we tidy the data?
#  #       A: population counts by age
#  #    b) Q: What are the key variables for when we tidy the data?
#  #       A: age groups
#  #    c) Get the data into a tidy format with dimensions 74,228 x 5.
#  
#  # 3. Take a look at d3 and 2015_WPPDataset_AllVariables.xls
#  
#  #    a) Q: What are the values for when we tidy the data?
#  #       A: population policies
#  #    b) Q: What are the key variables for when we tidy the data?
#  #       A: population issues
#  #    c) Get the data into a tidy format with dimensions 4,699 x 5.
#  
#  # 4. Take a look at d4 and the `Mid-2015 Persons` sheet of SAPE18DT14.xls
#  
#  #    a) Q: What are the values for when we tidy the data?
#  #       A: population counts by age
#  #    b) Q: What are the key variables for when we tidy the data?
#  #       A: age groups
#  #    c) Get the data into a tidy format with dimensions 143,431 x 5.
#  
#  # 5. Take a look at d5 and the tabell.csv
#  
#  #     a) Q: What are the values for when we tidy the data?
#  #        A: population counts by household size
#  #     b) Q: What are the key variables for when we tidy the data?
#  #        A: size of households
#  #     c) Get the data into a tidy format with dimensions 2,355 x 3. Save as d6
#  
#  # 6. Spread d6 to have rows corresponding to the family size (i.e 5 rows) and columns
#  #    corresponding to the areas (441 columns)

## ----eval=FALSE, prompt=FALSE-----------------------------------------------------
#  file.show("./data/wb_ginipov.csv")

## ---- message=FALSE---------------------------------------------------------------
df3 <- read_csv(file = "./data/wb_ginipov.csv", skip = 3, na = "..") %>%
  select(-`Series Name`)
df3

## ---------------------------------------------------------------------------------
# create a tidy data frame.
df4 <- spread(data = df3, key = `Series Code`, value = Value)
df4

## ---- echo=FALSE, eval=FALSE------------------------------------------------------
#  # print table3 (loaded with tidyr package)
#  table3
#  # separate
#  separate(table3, col = rate, into = c("rate", "pop"))
#  
#  # print table5 (loaded with tidyr package)
#  table5
#  # unite
#  unite(table5, century, year, col = "year", sep = "")
#  
#  # separate rows
#  separate_rows(table3, rate)

## ---------------------------------------------------------------------------------
separate(df2, period, into = c("year0", "year5"), sep = "-")

## ---------------------------------------------------------------------------------
separate(df2, period, into = c("year0", "year5"), sep = "-",
         convert = TRUE, remove = FALSE)

## ---------------------------------------------------------------------------------
# create data 
d0 <- data_frame(year = c(2010, 2000, 2015), alpha3 = c("CHN", "KOR", "JPN"))
d0

## ---------------------------------------------------------------------------------
# expand for all combinations
expand(d0, year, alpha3)

## ---------------------------------------------------------------------------------
# complete 
complete(d0, alpha3, year = full_seq(x = year, period = 5))

## ---------------------------------------------------------------------------------
# create data x
d0 <- data_frame(x1 = LETTERS[1:5], x2 = c(1, NA, NA, 3, NA))
d0
# drop_na
drop_na(d0)

## ---------------------------------------------------------------------------------
d0
# fill
fill(d0, x2)

## ---------------------------------------------------------------------------------
d0
# separate rows
replace_na(d0, list(x2 = 2))

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex42.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #     b) Run the code in ex42_prelim.R to import the data for this exercise
#  
#  ##
#  ##
#  ##
#  # 1.  Modify d2 to drop the rows with missing values
#  
#  # 2.  Modify d2 to separate the age column so that
#  #     a) two new columns for the first and last age in each group are created
#  #     b) the original age column is not removed
#  #     c) the new columns are integer values
#  
#  # 3.  Modify d3 to drop the rows with missing values
#  
#  # 4.  Uncomment the following code to display part of the policy data base in d3
#  # d3 %>%
#  #   filter(issue == "Measures on irregular immigration") %>%
#  #   select(name, issue, policy)
#  # 5.  a) Modify d3 using the separate_rows() function to create new rows for each policies that are comma delimited
#  #     (Hint: use sep = "," and the final data frame should be 7,796 rows)
#  #     b) Check they are working by re-running the R code from the previous question.
#  
#  # 6.  Modify d4 using the fill() function to replace the NA values in the name column
#  
#  # 7.  Modify d4 to separate the age column so that
#  #     a) two new columns for the first and last age in each group are created
#  #     b) the original age column is not removed
#  #     c) the new columns are integer values
#  
#  # 8.  Modify d4 to replace the na in last with 120
#  
#  # 9.  Modify d5 to drop the rows with missing values
#  
#  # 10. Modify d5 using the code template below to separate the area column so that
#  #     two new columns for the code and name in each group are created
#  #     (Hint: Replace the #### parts)
#  d5 <- separate(####, col = ####, #### = c("####", "####"),
#                 sep = "[:blank:]", fill = "right", extra = "merge")
#  
#  

## ---------------------------------------------------------------------------------
# for example
select(df2, name, period, tfr)

## ---------------------------------------------------------------------------------
# these are all the same... 
# select(df2, name, period:tfr)
# select(df2, -2)
# select(df2, -starts_with("c"))
# select(df2, -contains("c"))
select(df2, -code)

## ---------------------------------------------------------------------------------
filter(df2, period == "2010-2015", name == "China")

## ---------------------------------------------------------------------------------
# can also use `<` `>` `>=` `<=` `!=`
filter(df2, name == "China", tfr < 2)

# multiple matches on the same variable we can also use %in%
filter(df2, period == "2010-2015", code %in% c(156, 410))

## ---------------------------------------------------------------------------------
# for example
df2 %>% 
  filter(name == "China", tfr < 2) %>%
  select(-code)
# same as
# select(filter(.data = df2, name == "China", tfr < 2), -code)

## ---------------------------------------------------------------------------------
df2 %>% 
  filter(name == "China") %>%
  tail(n = 3)

## ---------------------------------------------------------------------------------
df2 %>% 
  filter(.data = ., name == "China") %>%
  tail(n = 3, x = .)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex43.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #     b) Run the soloution code of ex42 to import and transform the data for this exercise
#  source("./exercise-solutions/#####")
#  ##
#  ##
#  ##
#  # 1.  Display the observations in d1 from Austria
#  
#  # 2.  Display the distinct observations in d1 of each area name and code (241 rows)
#  
#  # 3.  Display the observations in d1 using pipes (%>%)
#  #     a) from Austria
#  #     b) the name, year and odr variables only
#  
#  
#  # 4.  Display the observations in d2 using pipes
#  #     a) from Philippines in 2015
#  #     b) the name, age and pop variables only
#  
#  
#  # 5.  Display the observations in d2 using pipes
#  #     a) from Australia in 2000 over 65
#  #     b) the name, age and pop variables only
#  
#  
#  # 6.  Display the observations in d3 using pipes
#  #     a) from Asian countries and issues on Policy on growth
#  #     b) the name and policy variables only
#  
#  
#  
#  
#  # 7.  Modify d4 to the major areas and at age 90+
#  #     (Hint: major areas are the rows where middle_name observations are missing)
#  
#  # 8.  Display the observations in d4 using pipes
#  #     a) the age group 90+
#  #     b) the name and pop variables only
#  #     c) the top 5 largest age 90+ populations
#  
#  
#  
#  
#  # 9.  Display the observations in d5 using pipes
#  #     a) from the regional level where the code is 2 characters longs)
#  #        (Hint: use the nchar() function to return the number of characters in a the code variable
#  #     b) from two people households
#  #     c) the name and people variables only
#  
#  
#  
#  

## ---------------------------------------------------------------------------------
df2 %>%
  mutate(tfr = round(tfr,1),
         location_type = ifelse(test = code >= 900, yes = "region", no = "nation")) 

## ---------------------------------------------------------------------------------
areas <- c("WORLD", "AFRICA", "ASIA", "EUROPE", "LATIN AMERICA AND THE CARIBBEAN",
           "NORTHERN AMERICA", "OCEANIA")
df2 %>%
  mutate(location_type = case_when(
    code < 900 ~ "country",
    name %in% areas ~ "area",
    code > 900 ~ "region")
  )

## ---------------------------------------------------------------------------------
df2 %>%
  mutate(name = recode(name, 
                       "AFRICA" = "Contient: Africa",
                       "Eastern Africa" = "Region: Eastern Africa"))

## ---------------------------------------------------------------------------------
df2 %>%
  rename(country_name = name)

## ---------------------------------------------------------------------------------
df2 %>%
  filter(name == "China", tfr < 2) %>%
  select(code, tfr) %>%
  mutate_all(funs(.*100))

df2 %>%
  filter(name == "China", tfr < 2) %>%
  mutate_if(is.numeric, funs(.*100))

## ---------------------------------------------------------------------------------
df2 %>%
  filter(name == "China", tfr < 2) %>%
  transmute(tfr = round(tfr,2))

## ---------------------------------------------------------------------------------
df2 %>%
  filter(name == "China") %>%
  arrange(tfr) 

## ---------------------------------------------------------------------------------
df2 %>%
  filter(name == "China") %>%
  arrange(desc(tfr))

## ---------------------------------------------------------------------------------
df5 <- read_excel("./data/WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls",
                   sheet = "ESTIMATES", skip = 16) %>%
  rename(name = `Major area, region, country or area *`, 
         code = `Country code`,
         year = `Reference date (as of 1 July)`) %>%
  filter(!(Notes %in% letters), code != 948) %>%
  select(-Index, -Variant, -Notes) %>%
  gather(key = age_grp, value = pop, -name, -code, -year)

## ---------------------------------------------------------------------------------
df5

## ---------------------------------------------------------------------------------
df5 %>%
  filter(name == "China", year == 2015) %>%
  arrange(age_grp)

## ---------------------------------------------------------------------------------
unique(df5$age_grp)

## ---------------------------------------------------------------------------------
df5 <- mutate(df5, age_grp = factor(age_grp, levels = unique(age_grp)))

# now arrange works well...
df5 %>%
  filter(name == "China", year == 2015) %>%
  arrange(age_grp)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex44.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #     b) Run the soloution code of ex43 to import and transform the data for this exercise
#  
#  ##
#  ##
#  ##
#  # 1. Modify d1 to add a `location_type` variable with value 2 if region and 1 if country
#  
#  # 2. Display the observations in d1 using pipes
#  #    a) from countries in 2015
#  #    b) sorted in descending order based on old age dependency ratio
#  
#  
#  
#  # 3. Modify d2 to
#  #    a) add location_type variable as above
#  #    b) change population from thousands to integer (Hint: * 1000)
#  #    c) change age to factor with levels in age order (Hint: use the unique() function)
#  
#  
#  
#  # 4. Display the levels of the age variable
#  
#  # 5. Display the observations in d2 using pipes
#  #    a) from countries in 2015 and age group 0-4
#  #    b) with the pop column renamed to pop_child
#  #    c) sorted in descending order based on pop_child variable
#  #    d) the name and pop_child column only only
#  
#  
#  
#  
#  
#  # 6. Modify d5 to
#  #    a) add a location_type variable based on the number of characters in the code variable
#  #    b) change size to factor with levels in order of the number of people
#  
#  
#  
#  # 7. Display the levels of the size variable
#  
#  # 8. Display the observations in d5 using pipes
#  #    a) from two people households regional level locations (where the code is 2 characters longs)
#  #    b) in ascending order based on the number of people
#  
#  
#  
#  # 9. Display the observations in d5 using pipes
#  #    a) from Oslo
#  #    b) the name, size and people columns only
#  
#  
#  

## ---------------------------------------------------------------------------------
# original data
df2

## ---------------------------------------------------------------------------------
# add columns for the all time mean tfr, max tfr and lagged tfr
df2 %>%
  filter(name %in% c("China", "Japan")) %>%
  group_by(name) %>%
  mutate(mean_tfr = mean(tfr),
         max_tfr = max(tfr),
         lag_tfr = lag(tfr))

## ---------------------------------------------------------------------------------
# original data
df5

## ---------------------------------------------------------------------------------
# summarise over all age groups for China and Japan
df5 %>%
  filter(year == 2015, name %in% c("China", "Japan"))  %>%
  summarise(pop_sum = sum(pop, na.rm = TRUE))

# summarise over all age groups for each of China and Japan
df5 %>%
  filter(year == 2015, name %in% c("China", "Japan"))  %>%
  drop_na() %>%
  group_by(name) %>%
  summarise(pop_sum = sum(pop),
            n = n(), 
            under5 = first(pop))

## ---------------------------------------------------------------------------------
df5 %>%
  filter(code < 900) %>%
  group_by(name, year) %>%
  summarise(pop_sum = sum(pop, na.rm = TRUE))

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex45.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #     b) Run the soloution code of ex44 to import and transform the data for this exercise
#  
#  ##
#  ##
#  ##
#  # 1. Display the observations in d1 using pipes
#  #    a) from Philippines, Indonesia and Malaysia
#  #    b) grouped by name
#  #    c) with a new max_odr variable for the maximum age dependency ratio in each over all years
#  #    d) with a new lag_odr variable for the old age dependency ratio five years previous in each country
#  
#  
#  
#  
#  
#  # 2. Create a new data set d6 from d2 that
#  #    a) filters to countries (Hint: location_type 1)
#  #    b) groups by name and year
#  #    c) summarises the population in each area and year (over age groups)
#  
#  
#  
#  
#  # 3. Display the observations in d3 using pipes
#  #    a) grouped by region
#  #    b) with a new variable called n_nations counting the number of different countries in each region
#  #       (Hint: use n_distinct(name))
#  
#  
#  
#  # 4. Display the observations in d3 using pipes
#  #    a) from `Measures on family and work balance` issues
#  #    a) grouped by region
#  #    c) with a new summary variable called family_policies counting the number of different family and work balance
#  #       measures in each country
#  
#  
#  
#  
#  # 5. Display the observations in d3 using pipes
#  #    a) filter issue to "Policy on growth"
#  #    b) grouped by policy and region
#  #    c) with a new summary variable called nation counting the number of countries in each region with each policy
#  #       (Hint: use n())
#  
#  
#  
#  
#  # 6. Create a new data set d7 from d4 using pipes that
#  #    a) group by name
#  #    b) add a new summary variable called old_pop summing the populaton in age groups over 65
#  #       (Hint: use sum(pop[.]) with [last > 65] to only sume those over 65)
#  #    c) add a new summary variable called work_pop summing the populaton in working age groups over (between 15 and 65)
#  #       (Hint: use sum(pop[.]) with [first >= 15 and last < 65] to only sume those in working age groups)
#  #    d) add a new variable for the age dependency ratio called odr
#  #       (Hint: odr = old_pop / work_pop * 100)
#  
#  
#  
#  
#  
#  # 7. Display the observations in d7 sorted with the lowest odr first
#  
#  # 8. Display the observations in d7 using pipes
#  #    a) from the top 10 highest odr
#  #    b) sorted with the highest odr first
#  
#  
#  # 9. Modify d5 to
#  #    a) group by name
#  #    b) with a new variable called pop counting the population in each area
#  
#  
#  

## ---------------------------------------------------------------------------------
# creating some demonstration data frames
d1 <- data_frame(A = c("a", "b", "c"), B = c("t", "u", "v"), C = 1:3)
d2 <- data_frame(A = c("a", "b", "d"), B = c("t", "u", "w"), D = 3:1)
d3 <- data_frame(A = c("c", "d"), B = c("v", "w"), C = 3:4)
d4 <- rename(d2, AA = A, BB = B)
d5 <- data_frame(A = c("a", "c", "c", "c"), D = 4:1)

## ---------------------------------------------------------------------------------
d1
d2
bind_rows(d1, d2)

## ---------------------------------------------------------------------------------
d1
d3
bind_rows(d1, d3)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex46.R')----
#  # 0.  Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  ##
#  ##
#  ##
#  # 1. Using WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls on future population sizes, read into R
#  #    a) the 1st sheet and save as r1
#  #    b) the 2st sheet and save as r2
#  #    c) print r1
#  #    d) print r2
#  r1 <- #####(path = "./exercise-data/WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls", skip = 16, sheet = 1)
#  ##### <- read_excel(path = "#####", skip = 16, sheet = #####)
#  r1
#  r2
#  # 2. Bind the rows of r1 and r2 and call the result r3
#  
#  # 3. a) Q: How many rows in r1
#  #       A:
#  #    b) Q: How many rows in r2
#  #       A:
#  #    b) Q: How many rows in r3
#  #       A:
#  # 4. Complete the following for loop to read all nine sheets of the
#  #    WPP2015_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xls speadsheet and
#  #    bind the rows into one data frame called r4
#  #    (Hint: Replace the ####)
#  r4 <- NULL
#  for(i in 1:####){
#    r0 <- read_excel(path = "####", skip = ####, sheet = i) %>%
#      ####(-Index, -Notes) %>%
#      ####(name = `Major area, region, country or area *`,
#             code = `Country code`,
#             year = `Reference date (as of 1 July)`,
#             type = Variant)
#    r4 <- bind_####(r4, r0)
#    print(nrow(r4))
#  }
#  r4
#  # 5. a) Q: How many rows in r4
#  #       A:
#  # 6. Display the observations in r4 using pipes
#  #    a) from China in 2100
#  #    b) the type and `80-84` column only
#  
#  
#  

## ---------------------------------------------------------------------------------
d1
d2
# by default joins by common names
left_join(d1, d2)

## ---------------------------------------------------------------------------------
d1
d2
# we can make this explicit
left_join(d1, d2, by = c("A" = "A", "B" = "B"))

## ---------------------------------------------------------------------------------
d1
d4
# can join when names are not the same using the `by` argument
left_join(d1, d4, by = c("A" = "AA", "B" = "BB"))

## ---------------------------------------------------------------------------------
d1
d5
left_join(d1, d5, by = "A")

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/APPI2018/exercise/ex47.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #     b) Run the soloution code of ex45 to import and transform the data for this exercise
#  
#  ##
#  ##
#  ##
#  # 1. View d6
#  
#  # 2. Create a new data set d8 that is a copy of d1, with only the code, year and odr variables
#  
#  # d8
#  # 3. Join the old age dependncy ratio obseravtions in d8 to the the corresponding countries and years in d6. Save as d9
#  
#  # d9
#  # 4. From the wpp.xlsx data.
#  #    a) read in the 4th sheet on total fertility rate and call it j1
#  #    b) read in the 5th sheet on infant mortality rates and call it j2
#  #    c) read in the 6th sheet on life expectancy and call it j3
#  #    d) read in the 7th sheet on net migration and call it j4
#  
#  
#  
#  
#  #    e) view the data
#  # j1; j2; j3; j4
#  # 5. Create a new data set j5 from j1 using pipes that joins together j1, j2, j3 and j4
#  
#  
#  
#  
#  # j5
#  # 6. Create a new data set j6 using pipes to separate the period column so that
#  #    a) two new columns for the first and last year in each period are created
#  #    b) the original period column is not removed
#  #    c) the new columns are integer values
#  #    and then
#  #    d) the name column is dropped
#  
#  
#  
#  # j6
#  # 8. Create a new data set d0 from d3 that contains only
#  #    a) observations on the Policy on growth issue
#  #    b) renames policy to growth_policy_2015
#  #    c) the name, code, region and growth_policy_2015 variables only
#  
#  
#  
#  
#  # d0
#  # 9. Create a new data set j7 that joins the population growth policy and region obseravtions in d0 to
#  #    the demographic data in j6 the corresponding countries
#  
#  # j7

