# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse packages
library(tidyverse)
#     c) Run the soloution code of ex43 to import and transform the data for this exercise
source("./exercise-solutions/ex43.R")
##
##
##
# 1. Modify d1 to add a `location_type` variable with value 2 if region and 1 if country
d1<-d1%>%
   mutate(location_type=ifelse(test=code>=900, yes="2",no="1"))
# 2. Display the observations in d1 using pipes
#    a) from countries in 2015
#    b) sorted in descending order based on old age dependency ratio

d1%>%
  filter(location_type=="1")%>%
  arrange(desc(odr))
# 3. Modify d2 to  
#    a) add location_type variable as above
#    b) change population from thousands to integer (Hint: * 1000)
#    c) change age to factor with levels in age order (Hint: use the fct_inorder() function)
d2<-d2%>%
  mutate(location_type=ifelse(test=code>=900, yes="2",no="1"),age=fct_inorder(age)) %>%
  mutate_at(d2,pop,funs(.*1000))

d2<-d2 %>%
  mutate(location_type=ifelse(test=code>=900, yes=2,no=1),
         age = factor(age, levels = unique(age)),
         pop=pop*1000)

d2 <- d2 %>%
  mutate(location_type = ifelse(test = code >= 900, yes = 2, no = 1),
         pop = pop * 1000,
         age = fct_inorder(age))

# 4. Display the levels of the age variable
unique(d2$age)
levels(d2$age)

# 5. Display the observations in d2 using pipes
#    a) from countries in 2015 and age group 0-4
#    b) with the pop column renamed to pop_child
#    c) sorted in descending order based on pop_child variable
#    d) the name and pop_child column only
d2 %>%
  rename(pop_child='pop')%>%
  filter(year==2015,age=="0-4") %>%
 
  arrange(desc(pop_child))%>%
  select("name",pop_child)
  




# 6. Modify d5 to
#    a) add a location_type variable based on the number of characters in the code variable
#    b) change size to factor with levels in order of the number of people
d5<-d5 %>%
   mutate(location_type=nchar(code),size=fct_inorder(people))
d5 <- d5 %>%
  mutate(location_type = nchar(code),
         size = factor(size, levels = unique(size)))

# 7. Display the levels of the size variable
levels(d5$size)
unique(d5$size)

# 8. Display the observations in d5 using pipes
#    a) from two people households regional level locations (where the code is 2 characters longs)
#    b) in ascending order based on the number of people

d5%>%
  filter(size=="two",nchar(code)==2)%>%
  arrange(people)
d5 %>%
  filter(location_type == 2, size == "two") %>%
  arrange(people)

# 9. Display the observations in d5 using pipes
#    a) from Oslo
#    b) the name, size and people columns only
d5%>%
  filter(name == "Oslo") %>%
  select(-code)


