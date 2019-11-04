# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse packages
library(tidyverse)
#     c) Run the soloution code of ex44 to import and transform the data for this exercise
source("./exercise-solutions/ex44.R")
##
##
##
# 1. Display the observations in d1 using pipes
#    a) from Philippines, Indonesia and Malaysia
#    b) grouped by name
#    c) with a new max_odr variable for the maximum age dependency ratio in each over all years
#    d) with a new lag_odr variable for the old age dependency ratio five years previous in each country
head(d1,20)

d1 %>%
  filter(name %in% c("Philippines","Indonesia","Malaysia"))%>%
  group_by(name) %>%
  summarise(max_odr=max(odr),
            lag_odr=max(odr,year<=1955))


  # 2. Create a new data set d6 from d2 that 
#    a) filters to countries (Hint: location_type 1)
#    b) groups by name and year
#    c) summarises the population in each area and year (over age groups)
d6<-d2%>%
  filter(location_type==1)%>%
  group_by(name,year)%>%
  summarise(pop_sum=sum(pop))



# 3. Display the observations in d3 using pipes
#    a) grouped by region
#    b) with a new variable called n_nations counting the number of different countries in each region
#       (Hint: use n_distinct(name))
d3%>%
  group_by(region)%>%
  summarise(n_nations=n_distinct(name) )


# 4. Display the observations in d3 using pipes
#    a) from `Measures on family and work balance` issues
#    a) grouped by region
#    c) with a new summary variable called family_policies counting the number of different family and work balance
#       measures in each country
d3%>%
  group_by(region)%>%
  filter(issue %in% c("Measures on family and work balance"))%>%
  summarise(family_policies=n_distinct(name) )



# 5. Display the observations in d3 using pipes
#    a) filter issue to "Policy on growth"
#    b) grouped by policy and region
#    c) with a new summary variable called nation counting the number of countries in each region with each policy
#       (Hint: use n())
d3%>%
  filter(issue %in% c("Policy on growth"))%>%
  group_by(policy,region)%>%
  summarise(nation=n())

# 6. Create a new data set d7 from d4 using pipes that 
#    a) group by name
#    b) add a new summary variable called old_pop summing the populaton in age groups over 65
#       (Hint: use sum(pop[.]) with [last > 65] to only sume those over 65)
#    c) add a new summary variable called work_pop summing the populaton in working age groups over (between 15 and 65)
#       (Hint: use sum(pop[.]) with [first >= 15 and last < 65] to only sume those in working age groups)
#    d) add a new variable for the age dependency ratio called odr 
#       (Hint: odr = old_pop / work_pop * 100)
d7<-d4%>%
  group_by(name)%>%
  summarise(old_pop=sum(pop[last > 65]),
   work_pop=sum(pop[first >= 15&last < 65]))%>%
   mutate(odr = old_pop / work_pop * 100)



# 7. Display the observations in d7 sorted with the lowest odr first
arrange(d7,odr)
  
# 8. Display the observations in d7 using pipes
#    a) from the top 10 highest odr
#    b) sorted with the highest odr first
d7%>%
  top_n(10)%>%
  arrange(desc(odr))
# 9. Modify d5 to  
#    a) group by name
#    b) with a new variable called pop counting the population in each area
  d5%>%
  group_by(name)%>%
  mutate(pop=sum(people))

