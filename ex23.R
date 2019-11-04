# 0.  a) Check your working directory is in the course folder. Load .Rproj file if not.
getwd()
#     b) Load the tidyverse package (which loads the ggplot2 package amongst others)
library(tidyverse)
#     c) Run the code in ex23_prelim.R to import the UN data for this exercise
source("./exercise/ex23_prelim.R")
##
##
##
# 1. Create a scatter plot of total fertility rate (x) against infant mortalitiy rate (y) in all 
#    countries from d1 with 
#    a) point colours matching area names 
#    b) point sizes matching the population size in millions
#    c) infant mortality axis transformed to the log10 scale
head(d1)
ggplot(data=d1,mapping=aes( x=tfr, y= imr, color=area_name,size=pop ))+ 
  geom_point()+
  coord_trans(y="log")

# 2. Create a bar plot of the immigration policies in different countries in 2015 from d1 with 
#    a) fill colour based on continent
#    b) bars are horizontal not vertical

ggplot(data=d1,mapping = aes(x=area_name,y=immigration_policy,fill=area_name))+geom_bar(stat="identity")+
   theme(legend.box = "horizontal")+
   coord_flip()

# 3. Create a scatter plot of total fertility rate (x) against life expectancy (y) in all countries
#    from d1 with 
#    a) point sizes matching the population size in millions
#    b) points to have transparency of 0.5
#    c) scatter plots for each continent in their own facet
#    d) use a log scale for the y axis

ggplot(data=d1, mapping=aes(x=tfr, y=e0,size=pop/100000, color=area_name))+
   geom_point(alpha=0.5)+
   coord_trans(y="log")+
   facet_wrap(facets="area_name")


# 4. Create a time plot of net (y) migration in Southeast Asian countries from d3 data with
#    a) bars equal to the size of the net migration in each period
#    b) bars plotted on the x-axis at their corresponding mid year point
#    c) time plots from each country in their own facet
#    d) a horizontal line where net migration is zero
head(d3)
ggplot(data=d3, mapping = aes(y=net, x=mid_year))+
    facet_wrap(facets="name")+
    geom_bar(stat="identity")+
    geom_hline(mapping=aes(yintercept=0))



# 5. Create a time plot of life expectancy (y) in Southeast Asian countries from d3 data with
#    a) lines and points from each country in their own facet
#    b) lines and points on the x-axis at their corresponding mid year point
#    b) life expecatancy axis free to vary in each facet
ggplot(data=d3, mapping=aes(x=mid_year,y=e0))+
  facet_wrap(facets="name",scales = "free_y")+
  geom_bar(stat="identity")



# 6. Create a scatter plot of total fertility rate (x) against infant mortality rate (y)
#    in all Asian countries from d4 with
#    a) each period in their own facet
#    b) smooth line through observations
#    b) facets by period in one row

ggplot(data=d4,mapping=aes(y=imr,x=tfr,color=area_name))+
  geom_point()+
  geom_smooth()+
  facet_wrap(facets = "period", nrow=1)

# 7. Create a time plot of the old age dependency ratio (odr) in all countries from d0 with
#    a) lines on the x-axis at the corresponding year
#    b) lines to have transparency of 0.3
#    c) facets by continent in one row
head(d0)
ggplot(data=d0, mapping=aes(x=year,y=odr,group=name))+
   geom_line(alpha=0.3)+
  facet_wrap(facets = "area_name",nrow=1)


# 8. Create a time plot of total fertility rate in all countries from d0 with
#    a) lines and points from each country with their own colour
#    b) lines and points on the x-axis at their corresponding mid year point
#    c) in a facet grid of fertility policies as rows and continents in columns
#    d) labels in facet to be a maximum of 20 characters wide
#    e) without a guide for the colour of the lines and points

ggplot(data=d0,mapping=aes(x=mid_year, y=tfr,color=name))+
    geom_point()+
    geom_path()+
    facet_grid(facets=fertility_policy~area_name, labeller=label_wrap_gen(20))+
    guides(color=FALSE)


