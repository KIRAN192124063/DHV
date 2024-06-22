# Install necessary packages if not already installed
install.packages("ggplot2")
install.packages("vcd")

# Load necessary libraries
#library(ggplot2)
#library(vcd)

# Create the dataset
data <- data.frame(
  SCHOOL = c('A', 'A', 'A', 'B', 'B', 'B', 'C', 'C', 'C', 'D', 'D', 'D'),
  GRADE_LEVEL = c('Grade 1', 'Grade 2', 'Grade 3', 'Grade 1', 'Grade 2', 'Grade 3', 
                  'Grade 1', 'Grade 2', 'Grade 3', 'Grade 1', 'Grade 2', 'Grade 3'),
  NUMBER_OF_STUDENTS = c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)
)

# Mosaic Plot
mosaic(~ SCHOOL + GRADE_LEVEL, data = data, main = "Mosaic Plot of School and Grade Level")

# Histogram Plot
ggplot(data, aes(x = NUMBER_OF_STUDENTS)) +
  geom_histogram(binwidth = 5, fill = 'blue', color = 'black') +
  labs(title = 'Histogram of Number of Students', x = 'Number of Students', y = 'Frequency')

# Scatter Plot
ggplot(data, aes(x = GRADE_LEVEL, y = NUMBER_OF_STUDENTS, color = SCHOOL)) +
  geom_point(size = 3) +
  labs(title = 'Scatter Plot of Number of Students by Grade Level and School', x = 'Grade Level', y = 'Number of Students') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
