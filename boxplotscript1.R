library(haven)
Ecuador<-read_dta("C:/Users/18800/Desktop/stat model/ipumsi_00067.dta")

##look at the data
head(Ecuador)
na.omit(Ecuador)
str(Ecuador)
hist(Ecuador$langec1)

## modify language&year 
is.character(Ecuador$langec1)

Ecuador$language<-as.factor(Ecuador$langec1)

class(Ecuador$year)
Ecuador$serial<-as.numeric(Ecuador$serial)


###names of language 
attr(Ecuador$langec1,"Labels" ) ### doesn't work 
x<-Ecuador$langec1["Labels"] 

labels(Ecuador$language) ## trying to change language labels into name instead of number 
levels(Ecuador$language)<-c("only spanish","only native","only foreign","spanish and native","spanish and foreign","native and foreign", "not in universe")
## I made this by copy paste 

x<-Ecuador$serial["Labels"] 
list()
##plot
                                                     
library(ggplot2)
ecu_boxplot<-ggplot(Ecuador,mapping=aes(x=language,y=serial/1000000,fill=language))+
  geom_boxplot()
ecu_boxplot



###data frame
str(Ecuador)
class(Ecuador)
Ec_map<-data.frame(year=Ecuador$year,serial=Ecuador$serial,geolev1=Ecuador$geolev1,language=Ecuador$language)
Ec_map$geolev1<-  as.numeric(Ec_map$geolev1)             
str(Ec_map)
  x<-Ecuador$sample["Labels"] 
### geo_mapplot
  list.files("/data/geo1_ec2001_2010")
  install.packages("raster")
  
  library(sp)
  library(raster)
getData('ISO3')
ECU_map1<-getData(name="GADM",country="ECU",level=3)

ECU_map<-getData(name="GADM",country="ECU",level=1)
par(mar=rep(0,4))
remove(ECU_map3)
plot(ECU_map1)
plot(ECU_map2)

library(sf)

plot(ECU_map3)
Ecuador$yearinstall.packages("rgeos")
library("rgeos")
e1<-st_as_sf(ECU_map3)
plot(e1)
head(e1)
head(Ecuador)
e1<-e1%>%
  mutate(geoleve)

library(tidyverse)

ggplot(data=e1)+
  geom_sf()

ggplot(data=filter(Ec_map,Ec_map$year==2001),
       mapping=aes(fill=language))+
  geom_sf+
  them_dark()

