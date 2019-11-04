# 0.  a) Check your working directory is in the course folder. Load .Rproj file if not.
getwd()
#     b) Load the tidyverse package (which loads the ggplot2 package amongst others)

#     c) Run the code in ex22_prelim.R to import the UN data for this exercise
source("./exercise/ex22_prelim.R")
##
##
##
# 1. Create create a line chart of life expectancy (y) during in South East Asian countries with d3
#    (Hint: use the group aesthetic to get lines for each country and mid_year for x)
ggplot(data=d3, mapping= aes(x=mid_year, y=e0,color=name))+geom_line()

# 2. Create a scatter plot of infant mortalitiy rate (x) against total fertility rate (y) 
#    in all countries from d1 with 
#    a) point colours matching area names 
#    b) point sizes matching the population size in millions

ggplot(data=d1, mapping=aes(x=imr, y=tfr, color=area_name, size=pop/1e6))+geom_point()

ggplot(data=d1, mapping=aes(x=imr, y=tfr, color=area_name, size=imr))+geom_point()

# 3. Create a time plot of life expectancy (y is e0) from Southeast Asian countries in d3 with
#    a) line types to to match country names
#    a) point and line colours to to match country names

ggplot(data=d3,mapping=aes(x=mid_year, y=e0, linetype=name,color=name))+
  geom_point(mapping = aes(size=pop))+
  geom_line()
###why can't i change the size????

# 4. Create a scatter plot of life expectancy (x) against total fertility rate (y) in all 
#    countries in all years from d1 with 
#    a) point colours matching growth policy 
#    b) point sizes matching the country population size in millions
#    c) horizontal line where tfr is 2.1

ggplot(data=d1,mapping=aes(x=e0, y=tfr,color=growth_policy,size=pop))+geom_point()+geom_hline(mapping=aes(yintercept=2.1))

# 5. Create a scatter plot of infant mortalitiy rate (x) against total fertility rate (y) 
#    Southeast Asian countries from d3 with 
#    a) point and path colours matching country names 
#    b) point and path transparency matching the mid year

ggplot(data=d3, mapping=aes(x=imr,y=tfr,color=name, alpha=mid_year))+geom_point()+geom_path()

# 6. Create a stacked density plot of total fertility rate in all countries in 2010-2015
#    from d1 with areas filled with a colour for growth policies.
#    (Hint: use poistion = "stack")
ggplot(data=d1, mapping=aes(x=tfr, fill=growth_policy))+geom_density(position = "stack")

# 7. Create a time plot of net migration in the UK from d2 data with
#    a) bars equal to the size of the net migration in each period
#    b) all bars with a blue fill colour
#    (Hint: use stat = "identity")
head(d2)
ggplot(data=d2,mapping=aes(x=period,y=net))+geom_bar(stat = "identity",position="stack",fill="yellow",alpha=0.7)+
  geom_line(color="pink",size=3)+
  geom_point()+
  geom_path()
