# 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#    b) load the tidyverse package
library(tidyverse)
##
##
##
# 1. load the data and convert the age column to a factor with levels in a sensible order
d0 <- read_csv(file = "./exercise-data/wpp2017_pop.csv") %>%
  mutate(age = fct_inorder(age))
# 2. create a pyramid function that has the x-axis fixed to the population of the 
#    largest age group in an year. 
pyrm <- function(d = NULL, m = max(d$pop)){
  # m argument above defaults to maximum population in data
  # code below is same as before except for the limits on y axis
  ggplot(data = d,
         mapping = aes(x =age , fill = gender,
                       y = ifelse(gender == "Male", yes = -pop, no = pop))) +
    geom_bar(stat = "identity") +
    #positive male labels
    scale_y_continuous(labels = abs, limits = c(-m, m)) +
    #bars to go vertically, rather than horizontal (deafult)
    coord_flip() +
    labs(x = "Age", y = "Populaton", fill = "Gender")
}
# 3. Use the pyrm() function to plot a pyramid for Italy in 2010
d1 <- filter(d0, name == "Italy", year == 2010)
pyrm(d = d1)
# 4. Run function to get population pyramids in China at 50 year intervals, starting in 1950.
for(i in seq(from = 1950, to = 2100, by = 50)){
  d1 <- filter(d0, name == "China")
  d2 <- filter(d1, year == i)
  pyrm(d = d2, m = max(d1$pop)) +
    labs(title = i)
  ggsave(paste0("china_", i, ".png"), width = 8, height = 5, units = "cm", scale = 1.4)
}

