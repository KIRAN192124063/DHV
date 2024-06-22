# Load necessary libraries
library(ggplot2)
library(dplyr)

# Create the data frame
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Age = c(25, 30, 28, 35, 40),
  Height = c(175, 180, 170, 165, 185),
  Weight = c(70, 80, 65, 75, 90)
)

# Scatter plot between Age and Weight
ggplot(data, aes(x = Age, y = Weight)) +
  geom_point() +
  ggtitle("Scatter Plot between Age and Weight") +
  xlab("Age") +
  ylab("Weight") +
  theme_minimal()

# Histogram of Height
ggplot(data, aes(x = Height)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  ggtitle("Histogram of Height") +
  xlab("Height") +
  ylab("Frequency") +
  theme_minimal()

# Line chart showing changes in Weight over IDs
ggplot(data, aes(x = ID, y = Weight)) +
  geom_line() +
  geom_point() +
  ggtitle("Line Chart of Weight over IDs") +
  xlab("ID") +
  ylab("Weight") +
  theme_minimal()

# Box plot of Age
ggplot(data, aes(y = Age)) +
  geom_boxplot() +
  ggtitle("Box Plot of Age") +
  ylab("Age") +
  theme_minimal()

# Density plot of Height
ggplot(data, aes(x = Height)) +
  geom_density(fill = "blue", alpha = 0.5) +
  ggtitle("Density Plot of Height") +
  xlab("Height") +
  ylab("Density") +
  theme_minimal()
