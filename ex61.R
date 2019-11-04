# 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
install.packages("sf")
#    b) load the tidyverse and sf packages
library(tidyverse)
library(sf)
#
# 1. Read in the geo1_ph1990_2000.shp in the data folder and save as phi1 object
phi1<-read_sf("./exercise-data/geo1_ph1990_2000/geo1_ph1990_2000.shp")
  
# 2. Print the phi1 object in the R console
phi1
# 3. Create a basic plot of phi1 using the plot function
plot(phi1)

# 4. Plot s0 using geom_polygons and coord_map
ggplot(phi1)+
  geom_sf()

# 5. Modify the code in 5 to
#    a) fill each region with a different colour (use the ADMIN_NAME column in s0)
#    b) have no legend for the fill colours
#    c) with a white sea

ggplot(phi1, mapping=aes(fill=ADMIN_NAME))+
  geom_sf()+
  guides(fill=FALSE)+
  theme_bw()



# 6. Modify the code in 6 to zoom in on the island of Mindanao (hint xlim = c(118, 128), ylim = c(4, 11))
ggplot(phi1, mapping=aes(fill=ADMIN_NAME))+
  geom_sf()+
  guides(fill=FALSE)+
  coord_sf(xlim = c(118, 128), ylim = c(4, 11))+
  theme_bw()




