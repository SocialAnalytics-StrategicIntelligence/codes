#-----

rm(list = ls())

worldMap='https://github.com/SocialAnalytics-StrategicIntelligence/codes/raw/main/maps/worlMapData.gpkg'

library(sf)
st_layers(worldMap)

#-----

countries=sf::st_read(worldMap,layer='countries')

#-----

library(ggplot2)

baseMap=ggplot(data=countries) 
choro1=baseMap + geom_sf(aes(fill=as.factor(Total_ei5)),
                         color=NA) 
choro1

saveRDS(layerRivers, file = "Brazil_rivers.rds")

layerCities=baseMap + geom_sf(data=cities) 
saveRDS(layerCities, file = "Brazil_cities.rds")

allLayers= layerRivers+ geom_sf(data=cities) 

saveRDS(allLayers, file = "Brazil_all.rds")
