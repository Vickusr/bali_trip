library(leaflet)
library(sf)
library(tidyverse)

bali <- read_csv('Bali Planning - Sheet1.csv')

bali_coords <- bali %>% select(Lat,Lng) %>% filter(is.na(Lat)==F)

clusters <- kmeans(bali_coords,centers = 6,iter.max = 100)
cluster_markers <- as_tibble(clusters$centers)

hclust(bali_coords)


leaflet(bali) %>% 
  addTiles() %>% 
  addMarkers(lat = ~Lat, lng = ~Lng, label = ~place, clusterOptions = markerClusterOptions())# %>% 
 # addAwesomeMarkers(data = cluster_markers, lat = ~Lat, lng = ~Lng, icon = awesomeIcons(markerColor = 'red'))


