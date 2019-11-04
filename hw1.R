
## read in ecuador data
library(tidyverse)
library(haven)
Ecuador<-read_dta("C:/Users/18800/Desktop/stat model/ecudoar/ipumsi_00006.dta")
head(Ecuador)

d0 <- Ecuador
d0$langec2 <- as_factor(d0$langec2)
d1 <- d0 %>%
  mutate(geo2_ec = as.integer(geo2_ec)) %>%
  group_by(geo2_ec) %>%
  summarise(n = n(),
            n_only_spanish = sum(langec1 == "only spanish"),
            p_only_spanish = n_only_spanish/n)


## read in map data
library(sf)
map2<-read_sf("C:/Users/18800/Desktop/stat model/ecudoar/shapefile2/geo2_ec1962_2010.shp")
head(map2)
par(mar=rep(x=0,times=4))
plot(map2)

library(tidyverse)
ggplot(data=map2)+
  geom_sf()


## join data 
Ecu_data<-map2 %>%
  mutate(geo2_ec=as.integer(GEOLEVEL2))%>%
  left_join(d1)
head(Ecu_data)


##plot 
ggplot(data=Ecu_data,
       mapping = aes(fill = p_only_spanish))+
  geom_sf()








## read in ecuador data
library(tidyverse)
library(haven)
Ecuador<-read_dta("C:/Users/18800/Desktop/stat model/ecudoar/ipumsi_00006.dta")
head(Ecuador)

d0 <- Ecuador
d0$langec2 <- as_factor(d0$langec2)
levels(d0$langec2)

d0$langec2[1]
d1 <- d0 %>%
  mutate(geo2_ec = as.integer(geo2_ec)) %>%
  group_by(geo2_ec,year)%>%
  summarise(n = n(),
            niu = sum( ),
           achuar = sum(langec2 == "achuar"),
           awapit = sum(langec2 == "awapit"),
           a_ingae = sum(langec2 == "a'ingae"),
           cha_palaa = sum(langec2 == "cha'palaa"),
           huao_terero = sum(langec2 == "huao / terero"),
           quichua_kichwa = sum(langec2 == "quichua or kichwa"),
           shuar_chicha = sum(langec2 == "shuar / chicha"),
           quichua_kichwa = sum(langec2 == "quichua or kichwa"),
           paicoca = sum(langec2 == "paicoca"),
           tsa_fiqui = sum(langec2 == "tsa'fiqui"),
           shiwiar = sum(langec2 == "shiwiar"),
           zia_pedee = sum(langec2 == "zia pedee"),
           zapara = sum(langec2 == "zapara"),
           andoa = sum(langec2 == "andoa"),
           response_suppressed = sum(langec2 == "response suppressed"),
           unknown = sum(langec2 == "unknown"),
            niu_p = max(achuar,awapit,a_ingae,cha_palaa,huao_terero,quichua_kichwa,paicoca,tsa_fiqui,shiwiar,
                        zia_pedee,zapara,andoa,response_suppressed,unknown))

d1 <- d0 %>%
  mutate(geo2_ec = as.integer(geo2_ec)) %>%
  group_by(geo2_ec,langec2)%>%
  summarise(n=n())

d2 <- d1 %>%
  mutate(geo2_ec = as.integer(geo2_ec)) %>%
  group_by(langec2)%>%
  summarise(lang=sum(n))

table(d0$langec2)


            
## read in map data
library(sf)
map2<-read_sf("C:/Users/18800/Desktop/stat model/ecudoar/shapefile2/geo2_ec1962_2010.shp")
head(map2)
par(mar=rep(x=0,times=4))
plot(map2)

library(tidyverse)
ggplot(data=map2)+
  geom_sf()


d2<-d1 %>%
  group_by(geo2_ec) %>%
  top_n(1)

## join data 
Ecu_data<-map2 %>%
  mutate(geo2_ec=as.integer(GEOLEVEL2))%>%
  left_join(d2)

Ecu_data<-Ecu_data%>%
  group_by(GEOLEVEL2)%>%
  summarise(lang=sum(n))

head(Ecu_data)



##plot 
ggplot(data=Ecu_data,
       mapping = aes(fill = langec2))+
  geom_sf()
