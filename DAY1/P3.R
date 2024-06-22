# Install and load required packages (uncomment if not already installed)
# install.packages("ggplot2")
# install.packages("reshape2")
library(ggplot2)
#install.packages("reshape2")
library(reshape2)

# Input data
data <- data.frame(
  Date = as.Date(c("2024-01-01", "2024-01-02", "2024-01-03", "2024-01-04", "2024-01-05", "2024-01-06")),
  StationA_Temperature = c(25.0, 24.5, 26.2, 23.8, 25.5, 23.0),
  StationA_Precipitation = c(0.1, 0.0, 0.3, 0.2, 0.1, 0.4),
  StationB_Temperature = c(23.5, 22.8, 25.0, 22.5, 24.5, 21.8),
  StationB_Precipitation = c(0.2, 0.3, 0.1, 0.0, 0.4, 0.2)
)

# Time Series Plot of Temperature and Precipitation
melted_data <- melt(data, id.vars = "Date", measure.vars = c("StationA_Temperature", "StationB_Temperature", "StationA_Precipitation", "StationB_Precipitation"),
                    variable.name = "Variable", value.name = "Value")
ggplot(melted_data, aes(x = Date, y = Value, color = Variable)) +
  geom_line() +
  labs(x = "Date", y = "Value", color = "Variable") +
  ggtitle("Temperature and Precipitation Over Time") +
  theme_minimal()

# Line Plot for Given Dataset (Station A's Temperature)
ggplot(data, aes(x = Date, y = StationA_Temperature)) +
  geom_line() +
  labs(x = "Date", y = "Temperature (Station A)") +
  ggtitle("Station A Temperature Over Time") +
  theme_minimal()

# Stacked Bar Plot for Given Dataset (Precipitation by Station)
data_long <- melt(data, id.vars = "Date", measure.vars = c("StationA_Precipitation", "StationB_Precipitation"),
                  variable.name = "Station", value.name = "Precipitation")
ggplot(data_long, aes(x = Date, y = Precipitation, fill = Station)) +
  geom_bar(stat = "identity") +
  labs(x = "Date", y = "Precipitation", fill = "Station") +
  ggtitle("Precipitation by Station Over Time") +
  theme_minimal()
