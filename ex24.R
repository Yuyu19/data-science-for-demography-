# 0.  a) Check your working directory is in the course folder. Load .Rproj file if not.
getwd()
#     b) Load the tidyverse package (which loads the ggplot2 package amongst others)
library(tidyverse)
#     c) Run the code in ex23_prelim.R to import the UN data for this exercise
source("./exercise/ex23_prelim.R")
##
##
##
# 1. Uncomment the code below (from ex23.R) and adapt to 
#    a) change the colour of the points to come from the "Set1" palette
#    b) give sensible names to the x and y axis, colour and size guides

 ggplot(data = d1, mapping = aes(x = tfr, y = imr, colour = area_name, size = pop/1e06)) +
  geom_point() +
  coord_trans(y = "log10") +
  scale_color_brewer(palette = "Set1")+
   labs(x="total fertility rate", y="infant mortality rate", colour="Continent", size="population")

  
# 2. save the last plot as a PNG file with name "myplot1" height 6cm and width 10cm and double the scale

  ggsave(filename= "myplot1.png", width=10, height=6,unit="cm", scale=2)  
  file.show("myplot1.png")
# 3. Create a tile chart of net migration (in millions) over time periods for countries in Southeast Asia in the d3 data
#    Save the plot as an object g
#    (Hint: net migration is in thousands, to get to millions divide by 1000)
g<- ggplot(data=d3, mapping = aes(x=period, y=name, fill= net/1000))+geom_tile()+
  scale_fill_gradient2(low="pink", high="red", mid = "white", midpoint = 0 )

# 4. Modify g to scale the fill gradient from red to black via white (white is at net migration of zero)

g<-g+scale_fill_gradient2(low="red", high="black", mid = "white", midpoint = 0 )
# 5. Modify g to have labels for the title, x- and y-axis and the fill colour.
g <-g+labs(x="time", y="country", fill="net migration")


# 6. Modify g to have a black and white theme
g<-g+theme_bw()

# 7. Uncomment below to alter the text angle on the x-axis
 g <- g + theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
 g
# 8. Save g as a PDF with name myplot2 width 20 and height 16
ggsave(filename = "myplot2.pdf", plot=g, width = 20, height = 16 )
