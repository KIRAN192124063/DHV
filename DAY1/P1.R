# Load necessary libraries
library(ggplot2)
library(dplyr)

# Create the dataset
data <- data.frame(
  Month = c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'),
  Economic_Condition = c('Good', 'Good', 'Good', 'Good', 'Fair', 'Fair', 'Good', 'Bad', 'Fair', 'Good', 'Bad', 'Fair'),
  Unemployment_Rate = c(10.7, 9.8, 10.2, 11.2, 15.75, 17.8, 19.4, 25.6, 18.6, 15.6, 26.7, 19.5)
)

# Convert Month to factor with levels in correct order
data$Month <- factor(data$Month, levels = c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))

# Stacked Bar Plot
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = 'identity') +
  labs(title = 'Stacked Bar Plot of Unemployment Rate by Month and Economic Condition', 
       x = 'Month', y = 'Unemployment Rate (%)') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = 'Set3')

# Pie Plot
pie_data <- data %>%
  count(Economic_Condition)

ggplot(pie_data, aes(x = "", y = n, fill = Economic_Condition)) +
  geom_bar(stat = 'identity', width = 1) +
  coord_polar(theta = 'y') +
  labs(title = 'Pie Plot of Economic Condition') +
  theme_void() +
  scale_fill_brewer(palette = 'Set3') +
  geom_text(aes(label = scales::percent(n / sum(n), accuracy = 0.1)), 
            position = position_stack(vjust = 0.5))

# Grouped Bar Plot
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  labs(title = 'Grouped Bar Plot of Unemployment Rate by Month and Economic Condition', 
       x = 'Month', y = 'Unemployment Rate (%)') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = 'Set3')
