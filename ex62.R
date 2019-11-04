# 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#    b) load the tidyverse and sf packages
library(tidyverse)
library(sf)
# 1. Read in the geo1_ph1990_2000.shp in the data folder and save as phi1 object
phi1<-read_sf("./exercise-data/geo1_ph1990_2000/geo1_ph1990_2000.shp")
# 2. Uncomment the code below to drop lake polygons
 phi1 <- filter(phi1, GEOLEVEL1 != 608888)
# 3. Read in geo2 summary data (phi_summary1.csv) in the data folder to an object called d0
 d0<-read_csv("./exercise-data/phi_summary1.csv")
# 4. Merge d0 into the sf object phi1
phi1<- phi1 %>%
 mutate(geolev1 = as.integer(GEOLEVEL1)) %>%
  left_join(d0)



# 5. Plot a map of the proportion married in 2000 with a colour scale 
#    using the Spectral palette
#    (Hint: use scale_fill_distiller())
ggplot(data = filter(phi1,year==2000), mapping=aes(fill=married))+
  geom_sf()+
  scale_fill_distiller(palette="Spectral")




# 6.  Adapt the code in 5 to plot maps in facet for the population (in millions)
#     in 1990, 1995, 2000 (year)
ggplot(data = phi1, mapping=aes(fill=married))+
  geom_sf()+
  scale_fill_distiller(palette="Spectral")+
  facet_wrap(facets = "year")





# 7. Build a data set c0 for the centroids of each region
c0 <- st_centroid(x = phi1)

# 8. Join the summary data from d0 to the centriod data c0
c0<- c0%>%
  mutate(geolev1 = as.numeric(GEOLEVEL1)) %>%
  left_join(d0)
c0


# 9. Plot the polygons from phi1 in a facet plot and add 
#    a) Points from c0 whose size correspond to the population in millions
#    b) Points that are all red with 0.25 transparency
#    c) A legend for the point size
ggplot(data = phi1)+
  geom_sf()+
  geom_sf(data=c0,
           mapping = aes(size=log(pop/1e04)),
         colour="red",alpha=0.25, show.legend = "point")+
facet_wrap(facets = "year") 

ggplot(data = phi1)+
  geom_sf()+
  geom_sf(data=filter(c0,year==1990),
          mapping = aes(size=pop/1e06),
          colour="red",alpha=0.25, show.legend = "point")
ggplot(data = phi1)+
  geom_sf()+
  geom_sf(data=filter(c0,year==2000),
          mapping = aes(size=pop/1e06),
          colour="red",alpha=0.25, show.legend = "point")

