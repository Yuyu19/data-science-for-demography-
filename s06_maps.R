## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA)
knitr::knit_hooks$set(purl = hook_purl)

## ------------------------------------------------------------------------
list.files("./data/geo1_pa1960_2010")

## ---- message=FALSE, warning = FALSE, fig.height = 2.5, fig.width=8------
# install.packages("sf")
library(sf)
pan2 <- read_sf("./data/geo2_pa1960_2010/geo2_pa1960_2010.shp")

pan2

## ---- fig.height = 2.5, fig.width=8--------------------------------------
# basic plot with zero margins (make map larger on slide)
par(mar = rep(x = 0, times = 4))
plot(pan2)

## ------------------------------------------------------------------------
# install.packages("raster")
library(raster)
getData('ISO3')

## ---- message=FALSE, fig.height = 6, fig.width = 6, fig.show='hold', out.width='4cm'----
library(raster)
kor0 <- getData(name = "GADM", country = "KOR", level = 0)
kor1 <- getData(name = "GADM", country = "KOR", level = 1)
kor2 <- getData(name = "GADM", country = "KOR", level = 2)
par(mar = rep(0, 4))
plot(kor0); plot(kor1); plot(kor2)

## ------------------------------------------------------------------------
# view the structure of the shape file (not an sf)
str(kor1, max.level = 2)

## ------------------------------------------------------------------------
# convert to sf
k1 <- st_as_sf(kor1)
k1

## ---- message=FALSE, warning = FALSE,  fig.height = 3, fig.width=6-------
plot(k1)

## ---- message=FALSE, fig.height = 5.5, fig.width=12----------------------
library(tidyverse)
ggplot(data = k1) +
  geom_sf()

## ---- message=FALSE, fig.height = 4, fig.width=10------------------------
# fill regions based on the NAME_1 column of k1
ggplot(data = k1, 
       mapping = aes(fill = NAME_1))  +
  geom_sf()

## ---- message=FALSE, fig.height = 4, fig.width=10------------------------
# drop guide, change theme, zoom in
ggplot(data = k1, mapping = aes(fill = NAME_1)) +
  geom_sf() +
  coord_sf(xlim = c(127, 130), ylim = c(37, 34)) +
  guides(fill = FALSE) +
  theme_bw()

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex61.R')----
#  # 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  getwd()
#  #    b) load the tidyverse and sf packages
#  library(#####)
#  library(#####)
#  #
#  # 1. Read in the geo1_ph1990_2000.shp in the data folder and save as phi1 object
#  
#  # 2. Print the phi1 object in the R console
#  
#  # 3. Create a basic plot of phi1 using the plot function
#  
#  
#  # 4. Plot s0 using geom_polygons and coord_map
#  
#  
#  # 5. Modify the code in 5 to
#  #    a) fill each region with a different colour (use the ADMIN_NAME column in s0)
#  #    b) have no legend for the fill colours
#  #    c) with a white sea
#  
#  
#  
#  
#  
#  # 6. Modify the code in 6 to zoom in on the island of Mindanao (hint xlim = c(118, 128), ylim = c(4, 11))
#  
#  
#  
#  
#  

## ---- message=FALSE, fig.height = 2.75, fig.width=6----------------------
# ipumsi data for panama
df2 <- read_csv("./data/pan_summary2.csv")
df2

## ---- message=FALSE, fig.height = 2.75, fig.width=6----------------------
# orginal shape data
pan2

## ---- message=FALSE, fig.height = 2.75, fig.width=6----------------------
pan2 <- pan2 %>%
  mutate(geolev2 = as.integer(GEOLEVEL2)) %>%
  left_join(df2)
pan2

## ---- message=FALSE, fig.height = 2.75, fig.width=6----------------------
ggplot(data = filter(pan2, year == 2010), 
       mapping = aes(fill = low_edu)) +
  geom_sf()

## ---- message=FALSE, fig.height = 2.75, fig.width=6----------------------
ggplot(data = filter(pan2, year == 2010), 
       mapping = aes(fill = age)) +
  geom_sf() +
  scale_fill_gradient(low = "white", high = "orange") +
  theme_dark()

## ---- warning=FALSE------------------------------------------------------
pan2_c <- st_centroid(x = pan2)
pan2_c

## ---- message=FALSE, fig.height = 2.5, fig.width=6-----------------------
# inspect c2 graphically
ggplot(data = pan2) +
  geom_sf() +
  geom_sf(data = pan2_c) +
  theme_bw()

## ---- warning=FALSE------------------------------------------------------
# better to have a points in each region - use st_point_on_surface()
pan2_s <- st_point_on_surface(x = pan2)
pan2_s

## ---- message=FALSE, fig.height = 2.5, fig.width=6-----------------------
# inspect
ggplot(data = pan2) +
  geom_sf() +
  geom_sf(data = pan2_s) +
  theme_bw()

## ---- message=FALSE, fig.height = 2.5, fig.width=8-----------------------
# plot data in s2
ggplot(data = pan2) +
  geom_sf() +
  geom_sf(data = filter(pan2_s, year == 2010), 
          mapping = aes(size = pop/1000),
          colour = "red", alpha = 0.5, show.legend = "point")  +
  theme_bw()

## ---- message=FALSE, fig.height = 6, fig.width=12------------------------
ggplot(data = pan2, 
       mapping = aes(fill = age)) +
  facet_wrap(facets = "year") +
  geom_sf() +
  scale_fill_gradient(low = "white", high = "orange") +
  theme_dark()

## ---- message=FALSE, fig.height = 6, fig.width=12------------------------
pan2 <- filter(pan2, !is.na(year))
ggplot(data = pan2, 
       mapping = aes(fill = age)) +
  facet_wrap(facets = "year") +
  geom_sf() +
  scale_fill_gradient(low = "white", high = "orange") +
  theme_dark()

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex62.R')----
#  # 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  getwd()
#  #    b) load the tidyverse and sf packages
#  library(#####)
#  library(#####)
#  # 1. Read in the geo1_ph1990_2000.shp in the data folder and save as phi1 object
#  
#  # 2. Uncomment the code below to drop lake polygons
#  # phi1 <- filter(phi1, GEOLEVEL1 != 608888)
#  # 3. Read in geo2 summary data (phi_summary1.csv) in the data folder to an object called d0
#  
#  # 4. Merge d0 into the sf object phi1
#  
#  
#  
#  
#  # 5. Plot a map of the proportion married in 2000 with a colour scale
#  #    using the Spectral palette
#  #    (Hint: use scale_fill_distiller())
#  
#  
#  
#  
#  
#  # 6.  Adapt the code in 5 to plot maps in facet for the population (in millions)
#  #     in 1990, 1995, 2000 (year)
#  
#  
#  
#  
#  
#  
#  # 7. Build a data set c0 for the centroids of each region
#  
#  # 8. Join the summary data from d0 to the centriod data c0
#  
#  
#  
#  
#  # 9. Plot the polygons from phi1 in a facet plot and add
#  #    a) Points from c0 whose size correspond to the population in millions
#  #    b) Points that are all red with 0.25 transparency
#  #    c) A legend for the point size
#  
#  
#  
#  
#  
#  

## ---- echo=FALSE, eval=FALSE---------------------------------------------
#  # setwd("C:\\Users\\Guy\\Dropbox\\DS4D2018\\slides-md")
#  # library(tidyverse)
#  # library(readstata13)
#  # d0 <- read.dta13("C:\\Users\\Guy\\Dropbox\\DS4D2018\\slides-md/data/ipumsi_phi.dta")
#  #
#  # d2 <- d0 %>%
#  #   tbl_df() %>%
#  #   select(-country, -sample, -serial, -pernum) %>%
#  #   mutate_if(is.factor, as.character) %>%
#  #   mutate(marst = ifelse(marst == "unknown/missing", NA, marst),
#  #          yrschool = ifelse(yrschool %in% c("unknown/missing", "niu (not in universe)"), NA, yrschool),
#  #          yrschool = ifelse(yrschool == "none or pre-school", 0, yrschool),
#  #          yrschool = ifelse(yrschool == "some tertiary", "15 years", yrschool),
#  #          disblnd = ifelse(disblnd == "unknown", NA, disblnd)) %>%
#  #   separate(col = yrschool, into = c("yrschool", "drop"), fill = "right")
#  #
#  # d3 <- d2 %>%
#  #   mutate(yrschool = as.numeric(yrschool)) %>%
#  #   group_by(year, geolev1) %>%
#  #   summarise(pop = sum(perwt),
#  #             yrschool = weighted.mean(yrschool, w = perwt, na.rm = TRUE),
#  #             # urban = weighted.mean(urban == "urban", w = perwt, na.rm = TRUE),
#  #             married = weighted.mean(marst == "married/in union", w = perwt, na.rm = TRUE))
#  # write.csv(d3, file = "./data/phi_summary1.csv", row.names = FALSE)
#  #
#  # d4 <- d2 %>%
#  #   mutate(yrschool = as.numeric(yrschool)) %>%
#  #   group_by(year, geolev2) %>%
#  #   summarise(pop = sum(perwt),
#  #             yrschool = weighted.mean(yrschool, w = perwt, na.rm = TRUE),
#  #             urban = weighted.mean(urban == "urban", w = perwt, na.rm = TRUE),
#  #             married = weighted.mean(marst == "married/in union", w = perwt, na.rm = TRUE))
#  # write.csv(d4, file = "./phi_summary2.csv", row.names = FALSE)

