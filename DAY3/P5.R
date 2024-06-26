# Create a data frame with the provided data
academic_data <- data.frame(
  Student = c("A", "B", "C", "D", "E"),
  Math_Score = c(85, 72, 90, 78, 88),
  Science_Score = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# 1. How do science scores vary with both math scores and attendance percentage?
print(academic_data)

# 2. Create a 3D scatter plot to visualize the relationship between math score, science score, and attendance
plot_ly(academic_data, x = ~Math_Score, y = ~Science_Score, z = ~Attendance, type = 'scatter3d', mode = 'markers') %>%
  layout(title = "3D Scatter Plot of Math Score, Science Score, and Attendance",
         scene = list(xaxis = list(title = "Math Score"),
                      yaxis = list(title = "Science Score"),
                      zaxis = list(title = "Attendance (%)")))

# 3. Correlation between attendance, math scores, and science scores based on the 3D plot
# The plot created above can be used to visually inspect for correlations.

# 4. Generate a 3D surface plot to show how science scores change with variations in both math scores and attendance
# Create a grid of math scores and attendance values
math_grid <- seq(min(academic_data$Math_Score), max(academic_data$Math_Score), length.out = 10)
attendance_grid <- seq(min(academic_data$Attendance), max(academic_data$Attendance), length.out = 10)

# Create a matrix to store science scores for the grid
science_matrix <- outer(math_grid, attendance_grid, function(math, attend) {
  # Interpolate science scores for the grid values
  interp_science <- with(academic_data, approx(x = Math_Score, y = Science_Score, xout = math)$y +
                           approx(x = Attendance, y = Science_Score, xout = attend)$y) / 2
  return(interp_science)
})

# Create the 3D surface plot
plot_ly(x = ~math_grid, y = ~attendance_grid, z = ~science_matrix, type = 'surface') %>%
  layout(title = "3D Surface Plot of Science Scores vs Math Scores and Attendance",
         scene = list(xaxis = list(title = "Math Score"),
                      yaxis = list(title = "Attendance (%)"),
                      zaxis = list(title = "Science Score")))

# 5. Compare the 3D plots of science scores against both math scores and attendance separately
# 3D plot of Science Score vs Math Score
plot_ly(academic_data, x = ~Math_Score, y = ~Science_Score, z = ~Attendance, type = 'scatter3d', mode = 'markers') %>%
  layout(title = "3D Scatter Plot of Science Score vs Math Score",
         scene = list(xaxis = list(title = "Math Score"),
                      yaxis = list(title = "Science Score"),
                      zaxis = list(title = "Attendance (%)")))

# 3D plot of Science Score vs Attendance
plot_ly(academic_data, x = ~Attendance, y = ~Science_Score, z = ~Math_Score, type = 'scatter3d', mode = 'markers') %>%
  layout(title = "3D Scatter Plot of Science Score vs Attendance",
         scene = list(xaxis = list(title = "Attendance (%)"),
                      yaxis = list(title = "Science Score"),
                      zaxis = list(title = "Math Score")))

# Save plots to file if needed
# ggsave("math_vs_science_attendance.png")
# saveWidget(plot_ly, "3d_surface_plot.html")
# saveWidget(plot_ly, "3d_scatter_plot_math.html")
# saveWidget(plot_ly, "3d_scatter_plot_attendance.html")
