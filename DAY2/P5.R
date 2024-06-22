# Load necessary libraries
library(ggplot2)
library(dplyr)
library(ggmap)
library(sf)
library(maps)

# Create the data frame
data <- data.frame(
  City = c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix"),
  Latitude = c(40.7128, 34.0522, 41.8781, 29.7604, 33.4484),
  Longitude = c(-74.0060, -118.2437, -87.6298, -95.3698, -112.0740),
  Population = c(8398748, 3990456, 2705994, 2325502, 1660272)
)

# Scatter plot of cities on a map based on Latitude and Longitude
map_data <- map_data("state")

ggplot() +
  geom_polygon(data = map_data, aes(x = long, y = lat, group = group), fill = "white", color = "black") +
  geom_point(data = data, aes(x = Longitude, y = Latitude), color = "red", size = 3) +
  ggtitle("Scatter Plot of Cities on a Map") +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_minimal()

# Bubble map where bubble size represents Population
ggplot() +
  geom_polygon(data = map_data, aes(x = long, y = lat, group = group), fill = "white", color = "black") +
  geom_point(data = data, aes(x = Longitude, y = Latitude, size = Population), color = "blue", alpha = 0.6) +
  scale_size_continuous(range = c(3, 15)) +
  ggtitle("Bubble Map of Population by City") +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_minimal()

# Choropleth map of Population by city (note: typically choropleth maps are for regions, but here we'll use cities)
data$Population_Category <- cut(data$Population, breaks = 5)

ggplot() +
  geom_polygon(data = map_data, aes(x = long, y = lat, group = group), fill = "white", color = "black") +
  geom_point(data = data, aes(x = Longitude, y = Latitude, color = Population_Category), size = 3) +
  scale_color_brewer(palette = "YlOrRd") +
  ggtitle("Choropleth Map of Population by City") +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_minimal()

# Bar plot showing the top 5 cities by Population
ggplot(data, aes(x = reorder(City, -Population), y = Population)) +
  geom_bar(stat = "identity", fill = "green") +
  ggtitle("Top 5 Cities by Population") +
  xlab("City") +
  ylab("Population") +
  theme_minimal()

# Heatmap showing the density of cities based on Population
ggplot(data, aes(x = Longitude, y = Latitude)) +
  stat_density2d(aes(fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  geom_point(color = "red", size = 3) +
  ggtitle("Heatmap of City Population Density") +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_minimal()
