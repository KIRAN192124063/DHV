# Load necessary libraries
library(ggplot2)
library(dplyr)
library(ggmosaic)

# Create the data frame
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Gender = c("Male", "Female", "Male", "Female", "Male"),
  Education = c("Graduate", "Undergrad", "High School", "Graduate", "Undergrad"),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer", "Artist")
)

# Bar plot showing the count of each Gender
ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "blue") +
  ggtitle("Count of Each Gender") +
  xlab("Gender") +
  ylab("Count") +
  theme_minimal()

# Pie chart representing the distribution of Education levels
education_counts <- data %>%
  count(Education)

ggplot(education_counts, aes(x = "", y = n, fill = Education)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  ggtitle("Distribution of Education Levels") +
  xlab("") +
  ylab("") +
  theme_minimal()

# Stacked bar plot showing the count of each Occupation by Gender
ggplot(data, aes(x = Occupation, fill = Gender)) +
  geom_bar(position = "stack") +
  ggtitle("Count of Each Occupation by Gender") +
  xlab("Occupation") +
  ylab("Count") +
  theme_minimal()

# Mosaic plot to visualize the association between Education and Occupation
ggplot(data) +
  geom_mosaic(aes(weight = 1, x = product(Education, Occupation))) +
  ggtitle("Mosaic Plot of Education and Occupation") +
  xlab("Education") +
  ylab("Occupation") +
  theme_minimal()

# Grouped bar plot showing counts of Gender across different Education levels
ggplot(data, aes(x = Education, fill = Gender)) +
  geom_bar(position = "dodge") +
  ggtitle("Counts of Gender Across Different Education Levels") +
  xlab("Education") +
  ylab("Count") +
  theme_minimal()
