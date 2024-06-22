library(ggplot2)
library(ggmosaic)
library(reshape2)

data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Browser = rep('Chrome', 5),
  Users = c(22.7, 25.8, 28.7, 30.5, 35.2)
)

pie_plot <- ggplot(data, aes(x = "", y = Users, fill = factor(Year))) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste0(Users, "%")), position = position_stack(vjust = 0.5), color = "white") +
  labs(title = "Pie Plot of Chrome Users Over Years", x = "", y = "Users", fill = "Year") +
  theme_minimal()

print(pie_plot)

mosaic_plot <- ggplot(data) +
  geom_mosaic(aes(weight = Users, x = product(Browser))) +
  labs(title = "Mosaic Plot of Chrome Users Over Years", x = "Browser", y = "Users", fill = "Year") +
  theme_minimal()

print(mosaic_plot)

scatter_plot <- ggplot(data, aes(x = Year, y = Users)) +
  geom_point(size = 4, aes(color = factor(Year))) +
  labs(title = "Scatter Plot of Chrome Users Over Years", x = "Year", y = "Users", color = "Year") +
  theme_minimal()

print(scatter_plot)
