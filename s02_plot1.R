## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA, fig.keep = FALSE)
knitr::knit_hooks$set(purl = hook_purl)

## ---- fig.height = 5, fig.width=6----------------------------------------
plot(x = swiss$Fertility, y = swiss$Education)

## ---- fig.height = 5, fig.width=6----------------------------------------
hist(swiss$Fertility)

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
library(tidyverse)
ggplot(data = swiss, mapping = aes(x = Fertility, y = Education)) +
  geom_point()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
ggplot(data = swiss, mapping = aes(x = Fertility)) +
  geom_histogram()

## ---- message=FALSE, fig.height = 2.5, fig.width=6-----------------------
df0 <- read_csv("C:/Users/18800/Desktop/data science for demography/handout/exercise-data/wpp_all.csv")
df1 <- filter(df0, period == "2010-2015")
ggplot(data = df1, mapping = aes(x = growth_policy)) +
  geom_bar()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr)) +
  geom_histogram()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr)) +
  geom_density()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr)) +
  geom_dotplot()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr, y = imr)) +
  geom_point()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr, y = imr)) +
  geom_rug()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr, y = imr)) +
  geom_line()+geom_smooth()+geom_plot()

## ---- message=FALSE, warning = FALSE,  fig.height = 2.5, fig.width=3-----
# all countries all periods
ggplot(data = df0, mapping = aes(x = tfr, y = imr)) +
  geom_bin2d()

## ---- message=FALSE, warning = FALSE, fig.height = 2.5, fig.width=3------
# all countries all periods
ggplot(data = df0, mapping = aes(x = tfr, y = imr)) +
  geom_density2d()

## ---- message=FALSE, warning = FALSE, fig.height = 2.5, fig.width=3------
# install.packages("hexbin")
ggplot(data = df0, mapping = aes(x = tfr, y = imr)) +
  geom_hex()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
df2 <- filter(df0, name == "China", !is.na(e0))
ggplot(data = df2, mapping = aes(x = mid_year, y = e0)) +
  geom_line()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# china 1960-65 to 2010-15
ggplot(data = df2, mapping = aes(x = mid_year, y = e0)) +
  geom_step()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# chinaf 1960-65 to 2010-15
ggplot(data = df2, mapping = aes(x = mid_year, y = e0)) +
  geom_area()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# geom_path() follows order in data
ggplot(data = df2, mapping = aes(x = tfr, y = imr)) +
  geom_path()

## ---- message=FALSE, fig.height = 2.5, fig.width=3-----------------------
# geom_line() follows order on x-axis (fine if time, if not need geom_path())
ggplot(data = df2, mapping = aes(x = tfr, y = imr)) +
  geom_line()

## ---- message=FALSE, fig.height = 2.5, fig.width=6-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = growth_policy, y = tfr)) +
  geom_boxplot()

## ---- message=FALSE, fig.height = 2.5, fig.width=6-----------------------
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = growth_policy, y = tfr)) +
  geom_violin()

## ---- message=FALSE, fig.height = 2.5, fig.width=6-----------------------
df3 <- filter(df0, reg_name == "Eastern Asia", !is.na(mid_year))
ggplot(data = df3, mapping = aes(x = mid_year, y = name, fill = sex_ratio)) +
  geom_tile()

## ---- message=FALSE, fig.height = 2, fig.width=6-------------------------
ggplot(data = df3, 
       mapping = aes(x = mid_year, y = str_wrap(string = name, width = 15),
                     fill = sex_ratio)) +
  geom_tile()

## ---- message=FALSE,  warning = FALSE,  fig.height = 2.25, fig.width=3----
# layers on all countries all periods
ggplot(data = df0, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_rug() +
  geom_smooth()

## ---- message=FALSE,  warning = FALSE, fig.height = 2.25, fig.width=3----
# points for on all countries all periods (df0), rug for 2010-15 data (df1)
# smooth line for china (df2) only
ggplot(data = df0, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_rug(data = df1) +
  geom_smooth(data = df2)

## ---- message=FALSE,  warning = FALSE,  fig.height = 2.25, fig.width=3----
# all countries 2010-15
ggplot(data = df1, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_vline(mapping = aes(xintercept = 2.1)) +
  geom_hline(mapping = aes(yintercept = mean(imr)))

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex21.R')----
#  # 0.  a) Set the working directory to the course folder on your computor by loading the .Rproj file
#  #     b) Check the working directory
#  getwd()
#  #     c) Load the tidyverse package (which loads the ggplot2 package amongst others)
#  library(#####)
#  #     d) Run the code in ex21_prelim.R to import the UN data for this exercise
#  source("./exercise./ex21_prelim.R")
#  #     e) Get familiar with the data by printing to console...
#  # all countries, all periods
#  d0
#  # all countrues, 2010-2015 only
#  d1
#  # UK data, all periods
#  d2
#  # South Eastern Asia data, all periods
#  d3
#  # Asia data, all periods
#  d4
#  ##
#  ##
#  ##
#  # 1. Create a scatter plot of infant mortalitiy rates (x) against total fertility rate (y)
#  #    in all countries and time periods
#  #    (Hint: a) see above to help select which data b) data is in the imr and tfr variables)
#  
#  
#  # 2. Create a bar plot of the immigration policies in different countries in 2015 from d1
#  #    (Hint: policiy data in the immigration_policy variable)
#  
#  
#  # 3. Create a boxplot chart of infant mortality rates for different continents in 2010-2015 from d1
#  #    (Hint: continents in the area_name variable)
#  
#  
#  # 4. Create a line chart of the total fertility rate (y) during the past 55 years (all years) in
#  #    the UK from d2
#  #    (Hint: use mid_year for x)
#  
#  
#  # 5. Create a tile chart of life expectancy over time for countries in Southeast Asia from d3
#  #    (Hint: life expectancy data in the e0 variable, country names in name variable and use
#  #     mid_year variable for x)
#  
#  
#  # 6. Create a line chart of net migration during the past 55 years (all years) in the UK from d2
#  #     (Hint: data for net migraiton in the net variable, use for y)
#  #     a) add points for each obervation
#  #     b) add a horizontal line at zero net migration
#  
#  
#  
#  
#  # 7. Use geom_bin2d() to show the distribution of countries tfr (y) in each period (x)
#  

## ---- message=FALSE, warning= FALSE,  fig.height = 2.5, fig.width=3------
# eastern asia: one smooth line and one data line through all points
ggplot(data = df3, mapping = aes(x = mid_year, y = tfr)) +
  geom_smooth() +
  geom_line()

## ---- message=FALSE,  warning= FALSE,  fig.height = 2.5, fig.width=3-----
# eastern asia: smooth line and data line for each country (identified by name)
ggplot(data = df3, mapping = aes(x = mid_year, y = tfr, group = name)) +
  geom_smooth() +
  geom_line()

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.0, fig.width=6-----
# eastern asia: set shape from discrete variable
ggplot(data = df3, mapping = aes(x = tfr, y = imr, shape = name)) +
  geom_point()

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.0, fig.width=6-----
# eastern asia: set colour from continuous variable
ggplot(data = df3, mapping = aes(x = tfr, y = imr, colour = name)) +
  geom_point()

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.0, fig.width=6-----
# eastern asia: set colour from continuous variable
ggplot(data = df3, mapping = aes(x = tfr, y = imr, colour = mid_year)) +
  geom_point()

## ---- message=FALSE,  warning= FALSE,  fig.height = 3, fig.width=6-------
# eastern asia: set colour and linetype from discrete variable
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, linetype = name)) +
  geom_point() +
  geom_path()

## ---- message=FALSE,  warning= FALSE,  fig.height = 2.5, fig.width=6-----
# eastern asia: set colour from discrete and alpah from continuous variable
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_point() +
  geom_path() +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 2.5, fig.width=6-----
# eastern asia: set colour and size from data, set alpha to 0.5 for all.
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, size = pop)) +
  geom_point(alpha = 0.5) +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# all countries 2010-15: stack position (default for geom_bar())
ggplot(data = df1, mapping = aes(x = growth_policy, fill = area_name)) +
  geom_bar()

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# all countries 2010-15: dodge position
ggplot(data = df1, mapping = aes(x = growth_policy, fill = area_name)) +
  geom_bar(position = "dodge")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# all countries 2010-15: fill position
ggplot(data = df1, mapping = aes(x = growth_policy, fill = area_name)) +
  geom_bar(position = "fill")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# china: count stat (default for geom_bar())
ggplot(data = df2, mapping = aes(x = period)) +
  geom_bar()

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# china: identity stat
ggplot(data = df2, mapping = aes(x = period, y = e0)) +
  geom_bar(stat = "identity")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# dnorm
ggplot(data = data_frame(x1 = c(-5, 5)), 
       mapping = aes(x = x1)) +
  stat_function(fun = dnorm)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex22.R')----
#  # 0.  a) Check your working directory is in the course folder. Load .Rproj file if not.
#  getwd()
#  #     b) Load the tidyverse package (which loads the ggplot2 package amongst others)
#  
#  #     c) Run the code in ex22_prelim.R to import the UN data for this exercise
#  source("./exercise/ex22_prelim.R")
#  ##
#  ##
#  ##
#  # 1. Create create a line chart of life expectancy (y) during in South East Asian countries with d3
#  #    (Hint: use the group aesthetic to get lines for each country and mid_year for x)
#  
#  
#  # 2. Create a scatter plot of infant mortalitiy rate (x) against total fertility rate (y)
#  #    in all countries from d1 with
#  #    a) point colours matching area names
#  #    b) point sizes matching the population size in millions
#  
#  
#  # 3. Create a time plot of life expectancy (y is e0) from Southeast Asian countries in d3 with
#  #    a) line types to to match country names
#  #    a) point and line colours to to match country names
#  
#  
#  
#  # 4. Create a scatter plot of life expectancy (x) against total fertility rate (y) in all
#  #    countries in all years from d1 with
#  #    a) point colours matching growth policy
#  #    b) point sizes matching the country population size in millions
#  #    c) horizontal line where tfr is 2.1
#  
#  
#  
#  # 5. Create a scatter plot of infant mortalitiy rate (x) against total fertility rate (y)
#  #    Southeast Asian countries from d3 with
#  #    a) point and path colours matching country names
#  #    b) point and path transparency matching the mid year
#  
#  
#  
#  # 6. Create a stacked density plot of total fertility rate in all countries in 2010-2015
#  #    from d1 with areas filled with a colour for growth policies.
#  #    (Hint: use poistion = "stack")
#  
#  
#  # 7. Create a time plot of net migration in the UK from d2 data with
#  #    a) bars equal to the size of the net migration in each period
#  #    b) all bars with a blue fill colour
#  #    (Hint: use stat = "identity")
#  

## ---- message=FALSE,  warning= FALSE,  fig.height = 3, fig.width=8-------
# eastern asia: fix coordinates: 1 coord unit of e0 (y) same as 0.05 tfr (x)
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_point() +
  geom_path() +
  coord_fixed(ratio = 0.05) +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3, fig.width=8-------
# eastern asia flip coordinates: x is y, y is x
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_point() +
  geom_path() +
  coord_flip() +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3, fig.width=8-------
# polar coordinates: x is now position in circle and y is distance from centre
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_point() +
  geom_path() +
  coord_polar() +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3, fig.width=8-------
# transform coordinates: put y on a log scale
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_point() +
  geom_path() +
  coord_trans(y = "log") +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# eastern asia: facet_wrap() function for each country (name)
ggplot(data = df3, mapping = aes(x = mid_year, y = tfr, colour = name)) +
  geom_point() +
  geom_line() +
  facet_wrap(facets = "name") +
  # to fit legend on my slides
  theme(legend.box = "horizontal")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# facet_wrap() function using one row and restrict label width
ggplot(data = df3, mapping = aes(x = mid_year, y = tfr, colour = name)) +
  geom_point() +
  geom_line() +
  facet_wrap(facets = "name", nrow = 1, labeller = label_wrap_gen(15)) +
  # drop country name guide
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# facet_wrap() function with different y axis limits
ggplot(data = df3, mapping = aes(x = mid_year, y = tfr, colour = name)) +
  geom_point() +
  geom_line() +
  facet_wrap(facets = "name", scales = "free_y") +
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# facet_wrap() function scatter plot
ggplot(data = df3,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_point() +
  geom_path() +
  facet_wrap(facets = "name") +
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# all data: facet_wrap() function scatter plot
ggplot(data = df0,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_path() +
  facet_wrap(facets = "area_name") +
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=8-----
# all data: facet_wrap() function scatter plot with x and y scales free
ggplot(data = df0,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_path() +
  facet_wrap(facets = "area_name", scales = "free") +
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# facet_grid() function scatter plot using area
ggplot(data = df0,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_path() +
  facet_grid(facets =  ~ area_name, labeller = label_wrap_gen(18)) +
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# facet_grid() function scatter plot using population growth policy
ggplot(data = df0,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_path() +
  facet_grid(facets = ~ growth_policy) +
  guides(colour = FALSE)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# facet_grid() function scatter plot using area and population growth policy
ggplot(data = df0,
       mapping = aes(x = tfr, y = imr, colour = name, alpha = mid_year)) +
  geom_path() +
  facet_grid(facets = growth_policy ~ area_name, labeller = label_wrap_gen(18)) +
  guides(colour = FALSE) +
  # rotate growth policy labels to fit legend on my slides
  theme(strip.text.y = element_text(angle = 0))

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex23.R')----
#  # 0.  a) Check your working directory is in the course folder. Load .Rproj file if not.
#  getwd()
#  #     b) Load the tidyverse package (which loads the ggplot2 package amongst others)
#  
#  #     c) Run the code in ex23_prelim.R to import the UN data for this exercise
#  source("./exercise/ex23_prelim.R")
#  ##
#  ##
#  ##
#  # 1. Create a scatter plot of total fertility rate (x) against infant mortalitiy rate (y) in all
#  #    countries from d1 with
#  #    a) point colours matching area names
#  #    b) point sizes matching the population size in millions
#  #    c) infant mortality axis transformed to the log10 scale
#  
#  
#  
#  # 2. Create a bar plot of the immigration policies in different countries in 2015 from d1 with
#  #    a) fill colour based on continent
#  #    b) bars are horizontal not vertical
#  
#  
#  
#  # 3. Create a scatter plot of total fertility rate (x) against life expectancy (y) in all countries
#  #    from d1 with
#  #    a) point sizes matching the population size in millions
#  #    b) points to have transparency of 0.5
#  #    c) scatter plots for each continent in their own facet
#  #    d) use a log scale for the y axis
#  
#  
#  
#  
#  # 4. Create a time plot of net (y) migration in Southeast Asian countries from d3 data with
#  #    a) bars equal to the size of the net migration in each period
#  #    b) bars plotted on the x-axis at their corresponding mid year point
#  #    c) time plots from each country in their own facet
#  #    d) a horizontal line where net migration is zero
#  
#  
#  
#  
#  # 5. Create a time plot of life expectancy (y) in Southeast Asian countries from d3 data with
#  #    a) lines and points from each country in their own facet
#  #    b) lines and points on the x-axis at their corresponding mid year point
#  #    b) life expecatancy axis free to vary in each facet
#  
#  
#  
#  
#  # 6. Create a scatter plot of total fertility rate (x) against infant mortality rate (y)
#  #    in all Asian countries from d4 with
#  #    a) each period in their own facet
#  #    b) smooth line through observations
#  #    b) facets by period in one row
#  
#  
#  
#  
#  # 7. Create a time plot of the old age dependency ratio (odr) in all countries from d0 with
#  #    a) lines on the x-axis at the corresponding year
#  #    b) lines to have transparency of 0.3
#  #    c) facets by continent in one row
#  
#  
#  
#  # 8. Create a time plot of total fertility rate in all countries from d0 with
#  #    a) lines and points from each country with their own colour
#  #    b) lines and points on the x-axis at their corresponding mid year point
#  #    c) in a facet grid of fertility policies as rows and continents in columns
#  #    d) labels in facet to be a maximum of 20 characters wide
#  #    e) without a guide for the colour of the lines and points
#  
#  
#  
#  

## ---- message=FALSE,  warning= FALSE,  fig.height = 2.5, fig.width=6-----
# eastern asia
ggplot(data = df3, mapping = aes(x = mid_year, y = tfr, colour = name, shape = name)) +
  geom_point() +
  geom_line() +
  scale_color_brewer(palette = "Dark2") +
  scale_shape_manual(values = 21:25)

## ---- message=FALSE,  warning= FALSE,  fig.height = 2.5, fig.width=6-----
ggplot(data = df3, mapping = aes(x = mid_year, y = name, fill = sex_ratio)) +
  geom_tile() +
  scale_fill_gradient2(low="pink", high="skyblue", mid = "white", midpoint = 105)

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# all countries 2010-15 data
ggplot(data = df1, mapping = aes(x = growth_policy, fill = area_name)) +
  geom_bar() +
  labs(title = "Population Growth Policies",
       subtitle = "Most African countries have lowering population growth policies. Most European countries have rising population growth policies.",
       caption = "Data: UN World Population Policy Database 2015",
       x = "Policy", y = "Countries", fill = "Continent")

## ---- message=FALSE,  warning= FALSE,  fig.height = 3.5, fig.width=9-----
# change theme
ggplot(data = df1, mapping = aes(x = growth_policy, fill = area_name)) +
  geom_bar() +
  theme_bw()

## ---- message=FALSE,  warning= FALSE, eval=FALSE-------------------------
#  # save a plot to an object
#  g <- ggplot(data = df1, mapping = aes(x = growth_policy, fill = area_name)) +
#    geom_bar()
#  # plot g with the black and white theme
#  g + theme_bw()

## ---- message=FALSE,  warning= FALSE, eval=FALSE-------------------------
#  # saves the last plot from RStudio as a PNG
#  ggsave(filename = "myplot.png", width = 10, height = 5, unit = "cm", scale = 2)
#  # saves the plot from object g as a PDF
#  ggsave(filename = "myplot.pdf", plot = g, width = 10, height = 5, unit = "cm")

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex24.R')----
#  # 0.  a) Check your working directory is in the course folder. Load .Rproj file if not.
#  getwd()
#  #     b) Load the tidyverse package (which loads the ggplot2 package amongst others)
#  library(#####)
#  #     c) Run the code in ex23_prelim.R to import the UN data for this exercise
#  #####("./exercise/ex23_prelim.R")
#  ##
#  ##
#  ##
#  # 1. Uncomment the code below (from ex23.R) and adapt to
#  #    a) change the colour of the points to come from the "Set1" palette
#  #    b) give sensible names to the x and y axis, colour and size guides
#  # ggplot(data = d1, mapping = aes(x = tfr, y = imr, colour = area_name, size = pop/1e06)) +
#  #   geom_point() +
#  #   coord_trans(y = "log10")
#  
#  
#  # 2. save the last plot as a PNG file with name "myplot1" height 6cm and width 10cm and double the scale
#  
#  # 3. Create a tile chart of net migration (in millions) over time periods for countries in Southeast Asia in the d3 data
#  #    Save the plot as an object g
#  #    (Hint: net migration is in thousands, to get to millions divide by 1000)
#  
#  
#  # 4. Modify g to scale the fill gradient from red to black via white (white is at net migration of zero)
#  
#  
#  # 5. Modify g to have labels for the title, x- and y-axis and the fill colour.
#  
#  
#  
#  # 6. Modify g to have a black and white theme
#  
#  
#  # 7. Uncomment below to alter the text angle on the x-axis
#  # g <- g + theme(axis.text.x = element_text(angle = 45, hjust = 1))
#  # g
#  # 8. Save g as a PDF with name myplot2 width 20 and height 16
#  

