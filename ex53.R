# 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#    b) load the shiny package

install.packages("shiny")

library(shiny)
##
##
# 1. load the data and convert the age column to a factor with levels in a sensible order
df0 <- read_csv(file = "./exercise-data/wpp2017_pop.csv") %>%
    mutate(age = fct_inorder(age))
# 2. complete the user interface to show the UN data for all countries/areas
my_ui <- fluidPage(
  #a row on top of the plot
  fluidRow(
    #within the row two columns. shiny apps always based on a width of 12.
    column(
      width = 6,
      # a box of all the possible countries that the user can select from
      selectInput(inputId = 'country', label = 'Choose Country',
                  choices = unique(df0$name))
    ),
    # slider in the second column in top row based the range of years in the data
    column(
      width = 6,
      sliderInput(inputId = "year", label = "Choose year",
                  value = min(df0$year), step = 5,
                  min = min(df0$year), max = max(df0$year), sep = "")
                  )
  ),
  plotOutput(outputId = "plot_pyr1")
)
# 3. complete the server() function to plot a pyramid from the area and year inputs
my_server <- function(input, output){
  output$plot_pyr1 <- renderPlot({
    df1 <- filter(df0, name == input$country)
    df2 <- filter(df1, year == input$year)
    pyrm(d = df2, m = max(df1$pop))
  })
}
# 4. runn the shiny app based on my_ui and my_server objects
shinyApp(ui = my_ui, server =  my_server)

