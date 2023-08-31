#-----

rm(list = ls())

brazilMaps='https://github.com/SocialAnalytics-StrategicIntelligence/codes/raw/main/maps/brazilMaps.gpkg'

library(sf)
st_layers(brazilMaps)

#-----

borders=sf::st_read(brazilMaps,layer='borders')
rivers=sf::st_read(brazilMaps,layer='rivers')
cities=sf::st_read(brazilMaps,layer='cities')

#-----

library(ggplot2)

baseMap=ggplot(borders) + geom_sf() 
layerRivers=baseMap + geom_sf(data=rivers)
saveRDS(layerRivers, file = "Brazil_rivers.rds")

layerCities=baseMap + geom_sf(data=cities) 
saveRDS(layerCities, file = "Brazil_cities.rds")

allLayers= layerRivers+ geom_sf(data=cities) 

saveRDS(allLayers, file = "Brazil_all.rds")
