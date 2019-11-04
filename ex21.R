# 0.  a) Set the working directory to the course folder on your computor by loading the .Rproj file 
#     b) Check the working directory
getwd()
#     c) Load the library(tidyverse package (which loads the ggplot2 package amongst others)
library(tidyverse)
#     d) Run the code in ex21_prelim.R to import the UN data for this exercise
source("./exercise./ex21_prelim.R")
#     e) Get familiar with the data by printing to console...
# all countries, all periods
d0
# all countrues, 2010-2015 only
d1
# UK data, all periods
d2
# South Eastern Asia data, all periods
d3
# Asia data, all periods
d4
##
##
##
# 1. Create a scatter plot of infant mortalitiy rates (x) against total fertility rate (y)
#    in all countries and time periods
#    (Hint: a) see above to help select which data b) data is in the imr and tfr variables)
ggplot(data=d0, mapping= aes(x=tfr, y=imr,color=mid_year))+geom_point()


# 2. Create a bar plot of the immigration policies in different countries in 2015 from d1
#    (Hint: policiy data in the immigration_policy variable)
head(d1)
ggplot(data=d1,mapping= aes(x=immigration_policy, fill=immigration_policy))+geom_bar()

# 3. Create a boxplot chart of infant mortality rates for different continents in 2010-2015 from d1
#    (Hint: continents in the area_name variable)
ggplot(data=d1,mapping= aes(x=area_name, y=tfr,fill=area_name))+geom_boxplot()

# 4. Create a line chart of the total fertility rate (y) during the past 55 years (all years) in 
#    the UK from d2
#    (Hint: use mid_year for x)
head(d2)
ggplot(data=d2,mapping=aes(x=mid_year,y=tfr))+geom_line()




# 5. Create a tile chart of life expectancy over time for countries in Southeast Asia from d3
#    (Hint: life expectancy data in the e0 variable, country names in name variable and use 
#     mid_year variable for x)
head(d3)
ggplot(data=d3,mapping=aes(x=mid_year,y=name,fill=e0,color="red"))+geom_tile()

# 6. Create a line chart of net migration during the past 55 years (all years) in the UK from d2
#     (Hint: data for net migraiton in the net variable, use for y)
#     a) add points for each obervation
#     b) add a horizontal line at zero net migration
head(d2)
ggplot(data=d2,mapping=aes(x=mid_year,y=net))+geom_line()+geom_hline(mapping=aes(yintercept=0),color="red")


# 7. Use geom_bin2d() to show the distribution of countries tfr (y) in each period (x)
head(d0)
ggplot(data=d0,mapping=aes(x=period,y=tfr))+geom_bin2d()

