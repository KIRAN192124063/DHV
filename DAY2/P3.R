# Load necessary libraries
library(ggplot2)
library(dplyr)
library(forecast)
library(zoo)

# Create the data frame
data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-02-01", "2023-03-01", "2023-04-01", "2023-05-01")),
  Sales = c(100, 120, 150, 130, 140)
)

# Line plot of Sales over time
ggplot(data, aes(x = Date, y = Sales)) +
  geom_line() +
  ggtitle("Line Plot of Sales Over Time") +
  xlab("Date") +
  ylab("Sales") +
  theme_minimal()

# Bar plot showing monthly average Sales
data$Month <- format(data$Date, "%Y-%m")

monthly_avg_sales <- data %>%
  group_by(Month) %>%
  summarise(Average_Sales = mean(Sales))

ggplot(monthly_avg_sales, aes(x = Month, y = Average_Sales)) +
  geom_bar(stat = "identity", fill = "blue") +
  ggtitle("Monthly Average Sales") +
  xlab("Month") +
  ylab("Average Sales") +
  theme_minimal()

# Seasonal decomposition of Sales
sales_ts <- ts(data$Sales, start = c(2023, 1), frequency = 12)
decomp <- stl(sales_ts, s.window = "periodic")

autoplot(decomp) +
  ggtitle("Seasonal Decomposition of Sales")

# Lag plot to analyze autocorrelation in Sales
gglagplot(sales_ts) +
  ggtitle("Lag Plot of Sales")

# Time series plot with a smoothed line of Sales
ggplot(data, aes(x = Date, y = Sales)) +
  geom_line() +
  geom_smooth(method = "loess") +
  ggtitle("Time Series Plot with Smoothed Line of Sales") +
  xlab("Date") +
  ylab("Sales") +
  theme_minimal()
