## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA)
knitr::knit_hooks$set(purl = hook_purl)

## ---- message=FALSE------------------------------------------------------
library(tidyverse)
df0 <- read_csv(file = "./data/wpp2017_pop.csv")
# Poland 2015 5-year age group data from UN to plot
df1 <- filter(df0, name == "Poland", year == 2015)
df1

## ----plot1, message=FALSE,  warning= FALSE,  fig.show='hide', fig.path="./plot/", fig.width = 9.5, fig.height =4----
ggplot(data = df1,
       mapping = aes(x = age, 
                     y = ifelse(gender == "Male", -pop, pop), fill = gender)) +
  # bar length based on the value in the y variable not count (default)
  geom_bar(stat = "identity") +
  labs(x = "Age", y = "Populaton", fill = "Gender")

## ---- echo = FALSE-------------------------------------------------------
knitr::include_graphics("./plot/plot1-1.pdf")

## ---- message=FALSE------------------------------------------------------
df0 <- mutate(df0, age = fct_inorder(age))
df1 <- filter(df0, name == "Poland", year == 2015)
df1

## ----plot2, message=FALSE,  warning= FALSE,  fig.show='hide', fig.path="./plot/", fig.width = 7, fig.height = 5----
ggplot(data = df1,
       mapping = aes(x = age, 
                     y = ifelse(gender == "Male", -pop, pop), fill = gender)) +
  geom_bar(stat = "identity") +
  #positive male labels
  scale_y_continuous(labels = abs) +
  #bars to go vertically, rather than horizontal (deafult)
  coord_flip() +
  labs(x = "Age", y = "Populaton", fill = "Gender")

## ---- echo = FALSE-------------------------------------------------------
knitr::include_graphics("./plot/plot2-1.pdf")

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex51.R')----
#  # 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #    b) load the tidyverse package
#  
#  ##
#  ##
#  ##
#  # 1. load the data and convert the age column to a factor with levels in a sensible order
#  d0 <- #####(file = "./exercise-data/wpp2017_pop.csv") %>%
#    mutate(age = #####(age))
#  # 2. create a pyramid function that has the x-axis fixed to the population of the
#  #    largest age group in an year.
#  pyrm <- function(d = NULL, m = max(d$pop)){
#    # m argument above defaults to maximum population in data
#    # code below is same as before except for the limits on y axis
#    ggplot(data = d,
#           mapping = aes(x = #####, fill = gender,
#                         y = ifelse(gender == "Male", yes = #####, no = pop))) +
#      geom_bar(stat = #####) +
#      #positive male labels
#      scale_y_continuous(labels = #####, limits = c(-m, m)) +
#      #bars to go vertically, rather than horizontal (deafult)
#      coord_#####() +
#      labs(x = "Age", y = "Populaton", fill = "Gender")
#  }
#  # 3. Use the pyrm() function to plot a pyramid for Italy in 2010
#  d1 <- filter(d0, name == "#####", year == #####)
#  pyrm(d = d1)
#  # 4. Run function to get population pyramids in China at 50 year intervals, starting in 1950.
#  for(i in #####(from = 1950, to = #####, by = 50)){
#    d1 <- filter(d0, ##### == "China")
#    d2 <- filter(d1, year == i)
#    pyrm(data = d2, m = max(d1$pop)) +
#      labs(title = i)
#    ggsave(paste0("china_", i, ".png"), width = 8, height = 5, units = "cm", scale = 1.4)
#  }

## ---- include=FALSE------------------------------------------------------
#copy and paste from ex51
pyrm <- function(data = NULL, m = max(data$pop)){
  # m argument above defaults to maximum population in data
  # code below is same as before except for the limits on y axis
  ggplot(data = data,
         mapping = aes(x = age, fill = gender, 
                       y = ifelse(gender == "Male", -pop, pop))) +
    geom_bar(stat = "identity") +
    #positive male labels
    scale_y_continuous(labels = abs, limits = c(-m, m)) +
    #bars to go vertically, rather than horizontal (deafult)
    coord_flip() +
    labs(x = "Age", y = "Populaton", fill = "Gender")
}

## ----plot21, message=FALSE,  warning= FALSE,  fig.show='hide', fig.path="./plot/", fig.width = 7, fig.height = 5----
# all past data
df2 <- filter(df0, name == "Poland", year <= 2015)

ggplot(data = df2,
       mapping = aes(y = ifelse(test = gender == "Male", yes = -pop, no = pop),
                     x = age, fill = gender)) +
  geom_bar(data = filter(df2, year == 2015),
           stat = "identity") +
  geom_step(data = filter(df2, year == 1950),
            mapping = aes(x = as.numeric(age) - 0.5),
            colour = "black") +
  scale_y_continuous(labels = abs) +
  labs(x = "Age", y = "Populaton", fill = "Gender") +
  coord_flip() 

## ---- echo = FALSE-------------------------------------------------------
knitr::include_graphics("./plot/plot21-1.pdf")

## ----plot23, message=FALSE,  warning= FALSE,  fig.show='hide', fig.path="./plot/", fig.width = 14, fig.height = 10----
# all past data
df2 <- filter(df0, name == "Poland", year <= 2015)

ggplot(data = df2,
       mapping = aes(y = ifelse(test = gender == "Male", yes = -pop, no = pop),
                     x = age, fill = gender)) +
  facet_wrap("year") +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs, limits = max(df2$pop) * c(-1,1)) +
  labs(x = "Age", y = "Populaton", fill = "Gender") +
  coord_flip() 

## ---- echo = FALSE-------------------------------------------------------
knitr::include_graphics("./plot/plot23-1.pdf")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(readxl)
df3 <- read_excel("./data/austria.xlsx", sheet = 3, skip = 2)
df3

## ---- message=FALSE, warning=FALSE---------------------------------------
# notice age is a character string (because of 110+)
tail(df3, 5)

## ----plot3, message=FALSE,  warning= FALSE,  fig.show='hide', fig.path="./plot/", fig.width = 7, fig.height = 5----
# change Age column to numeric and format for pyramid function (tidy, lower case names)
df4 <- df3 %>%
  select(-Total) %>%
  mutate(Age = ifelse(Age == "110+", 110, Age),
         Age = as.numeric(Age)) %>%
  gather(key = gender, value = pop, -Year, -Age) %>%
  rename(age = Age, year = Year)
df5 <- filter(df4, year == 2015)
df5
pyrm(data = df5)

## ---- echo = FALSE-------------------------------------------------------
knitr::include_graphics("./plot/plot3-1.pdf")

## ---- warning=FALSE------------------------------------------------------
# install intstallr
# install.packages("installr")
# library(installr)

# install imagemagick
# install.imagemagick()

# install gganimate from Thomas Lin Pedersen github (depends on animation)
# library(devtools)
# install_github("thomasp85/gganimate")

## ---- warning=FALSE, eval = FALSE----------------------------------------
#  library(gganimate)
#  
#  g <- ggplot(data = df4,
#              mapping = aes(y = ifelse(test = gender == "Male", yes = -pop, no = pop),
#                            x = age, fill = gender)) +
#    geom_bar(stat = "identity",
#             position = "identity") +
#    scale_y_continuous(labels = abs, limits = max(df4$pop) * c(-1,1)) +
#    coord_flip() +
#    # gganimate specific
#    labs(x = "Age", y = "Populaton", fill = "Gender", title = 'Year: {round(frame_time)}') +
#    transition_time(time = year)

## ---- warning=FALSE, eval=FALSE------------------------------------------
#  gg <- animate(g, width = 15, height = 25, units = "cm", res = 100)
#  gg
#  
#  # saves last_animation()
#  anim_save(filename = "./plot/austria.gif", width = 15, height = 25, units = "cm", res = 100)
#  
#  # view the file
#  file.show("./plot/austria.gif")

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex52.R')----
#  # 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  getwd()
#  #    b) Make sure that ImageMagick is installed on your computer (using the guide in the slides)
#  #    c) Load the gganimate and magick packages
#  
#  
#  ##
#  ##
#  ##
#  # 1. load the data and convert the age column to a factor with levels in a sensible order
#  # d0 <- read_csv(file = "./exercise-data/wpp2017_pop.csv") %>%
#  #   mutate(age = fct_inorder(age))
#  # 2. complete the code below to create a population pyramid for the country of your choice
#  #    a) filter country you want to plot
#  d1 <- filter(d0, name == "#####")
#  #    b) check that used the right country name - d1 should have more than zero rows
#  d1
#  #    c) plot code for animation
#  ggplot(data = #####,
#         mapping = aes(y = #####(test = gender == "Male", yes = -pop, no = pop),
#                       x = age, fill = gender)) +
#    #####(stat = "identity",
#             position = #####) +
#    scale_y_continuous(labels = #####, limits = max(d1$pop) * c(-1,1)) +
#    coord_flip() +
#    labs(x = "Age", y = "#####", fill = "Gender", title = 'Year: {#####(frame_time)}') +
#    #####(time = year)
#  #    d) save and view the animation
#  g <- #####()
#  #####(image = g, path = "./#####.gif")
#  file.show("./#####.gif")

## ---- warning=FALSE------------------------------------------------------
library(shiny)

my_ui <- fluidPage(
  #at the top of the page is a slider which we call year
  sliderInput(
    inputId = "year",
    #label to appear:
    label = "Choose year",
    #on loading the slider will be set to the first year and move in 1 year steps
    value = min(df1$year), step = 1,
    #the slider range comes from the data
    min = min(df1$year), max = max(df1$year),
    #this get rid of a default `,` seperation on the slider values; "194,7"
    sep = ""),
  #after the slider comes the plot
  plotOutput(outputId = "plot_pyr1")
)

## ---- eval=FALSE---------------------------------------------------------
#  my_server <- function(input, output){
#    #render a plot called plot_pyr1 based on our data and the year chosen by the
#    #user from the ui (slider) object called year
#    output$plot_pyr1 <- renderPlot({
#      df2 <- filter(df1, year == input$year)
#      pyrm(data = df2, m = max(df1$pop))
#    })
#  }
#  
#  # run the app
#  shinyApp(ui = my_ui, server =  my_server)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex53.R')----
#  # 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #    b) load the shiny package
#  
#  ##
#  ##
#  ##
#  # 1. load the data and convert the age column to a factor with levels in a sensible order
#  # df0 <- read_csv(file = "./exercise-data/wpp2017_pop.csv") %>%
#  #    mutate(age = fct_inorder(age))
#  # 2. complete the user interface to show the UN data for all countries/areas
#  my_ui <- fluidPage(
#    #a row on top of the plot
#    fluidRow(
#      #within the row two columns. shiny apps always based on a width of 12.
#      column(
#        width = 6,
#        # a box of all the possible countries that the user can select from
#        selectInput(inputId = 'country', label = 'Choose Country',
#                    choices = unique(df0$#####))
#      ),
#      # slider in the second column in top row based the range of years in the data
#      column(
#        width = 6,
#        sliderInput(inputId = "year", label = "Choose year",
#                    value = min(df0$year), step = #####,
#                    min = min(df0$year), max = max(df0$#####), sep = "")
#      )
#    ),
#    plotOutput(outputId = "plot_pyr1")
#  )
#  # 3. complete the server() function to plot a pyramid from the area and year inputs
#  my_server <- function(input, output){
#    output$plot_pyr1 <- renderPlot({
#      df1 <- filter(df0, name == input$#####)
#      df2 <- filter(df1, ##### == input$year)
#      pyrm(data = #####, m = max(#####$pop))
#    })
#  }
#  # 4. runn the shiny app based on my_ui and my_server objects
#  #####(ui = my_ui, server =  #####)

## ---- echo=FALSE---------------------------------------------------------
##
##UN data base construction (for the CSV file)
##
# install.packages("wpp2017")
# library(wpp2017)
# data(popF)
# data(popM)
# data(popFprojMed)
# data(popMprojMed)
# 
# df0 <- popF %>%
#   left_join(popFprojMed) %>%
#   mutate(gender = "Female")
# 
# df1 <- popM %>%
#   left_join(popMprojMed) %>%
#   mutate(gender = "Male") %>%
#   bind_rows(df0) %>%
#   mutate(age = fct_inorder(age))
# 
# df2 <- df1 %>%
#   tbl_df() %>%
#   gather(key = year, value = pop, -name, -country_code, -age, -gender) %>%
#   replace_na(list(pop = 0)) %>%
#   filter(country_code < 900)
# 
# write_csv(df2, "C:/Users/Guy/Dropbox/DS4D2018/slides-md/data/wpp2017_pop.csv")


# # install.packages("tweenr")
# library(tweenr)
# df1 <- df0 %>%
#   filter(name == "Poland", year <= 2015)
# 
# df2 <- df1 %>%
#   mutate(ease = "linear",
#          age_gender = paste(age, gender, sep = "_")) %>%
#   select(year, age_gender, ease, pop)
# 
# df3 <- tween_elements(data = df2, time = "year", group = "age_gender", ease = "ease", 
#                       nframes = 100) %>%
#   tbl_df() %>%
#   separate(col = .group, into = c("age", "gender"), sep = "_", remove = FALSE) %>%
#   mutate(age = factor(age, levels = levels(df1$age))) %>%
#   left_join(df1 %>% select(-pop)) %>%
#   arrange(age, gender, year)
# 
# df3 <- df3 %>%
#   mutate(year = ifelse(!is.na(name), year, NA)) %>%
#   fill(year_label) 
# 
# g <- ggplot(data = df3,
#             mapping = aes(y = ifelse(test = gender == "Male", yes = -pop, no = pop),
#                           x = age, fill = gender, frame = .frame)) +
#   geom_bar(stat = "identity", 
#            position = "identity") +
#   scale_y_continuous(labels = abs) +
#   coord_flip() +
#   labs(x = "Age", y = "Populaton", fill = "Gender") 
# 
# 
# magickPath <- shortPathName("C:\\Program Files\\ImageMagick-7.0.6-Q16\\magick.exe")
# gganimate(g, ani.options = ani.options(convert=magickPath), interval = 0.)


