# 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#    b) Make sure that ImageMagick is installed on your computer (using the guide in the slides)
#    c) Load the gganimate and magick packages

install.packages("devtools")
devtools::install_github("thomasp85/gganimate")
library(gganimate)
library(magick)

##
##
##
# 1. load the data and convert the age column to a factor with levels in a sensible order
# d0 <- read_csv(file = "./exercise-data/wpp2017_pop.csv") %>%
#   mutate(age = fct_inorder(age))
# 2. complete the code below to create a population pyramid for the country of your choice
#    a) filter country you want to plot
d1 <- filter(d0, name == "#####")
#    b) check that used the right country name - d1 should have more than zero rows
d1
#    c) plot code for animation
ggplot(data = #####,
       mapping = aes(y = #####(test = gender == "Male", yes = -pop, no = pop),
                     x = age, fill = gender)) +
  #####(stat = "identity",
           position = #####) +
  scale_y_continuous(labels = #####, limits = max(d1$pop) * c(-1,1)) +
  coord_flip() +
  labs(x = "Age", y = "#####", fill = "Gender", title = 'Year: {#####(frame_time)}') +
  #####(time = year)
#    d) save and view the animation
#####(filename = "./#####.gif")
file.show("./#####.gif")
