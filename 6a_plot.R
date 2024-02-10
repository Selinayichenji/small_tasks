library(ggplot2)


#simulation
set.seed(42)
hours <- 9:16
customers <- sample(3:8, size = length(hours), replace = TRUE)

# Positive and Negative correlation
efficiency_pos <- runif(length(hours), 0.8, 1.2) * customers
efficiency_neg_clear <- rev(sort(runif(length(hours), 0.8, 1.2))) / customers

# Set data frame
frame <- data.frame(Hour = hours, 
                    Customers = customers, 
                    Efficiency_Positive = efficiency_pos, 
                    Efficiency_Negative_Clear = efficiency_neg_clear)
print(frame)
# Plot
final_plot <- ggplot(frame) +
  geom_point(aes(x = Hour, y = Efficiency_Positive, size = Customers, color = 'Positive Correlation')) +
  geom_point(aes(x = Hour, y = Efficiency_Negative_Clear, size = Customers, color = 'Negative Correlation - Clear')) +
  scale_color_manual(values = c('Positive Correlation' = 'blue', 'Negative Correlation - Clear' = 'red')) +
  theme_minimal() +
  labs(title = "Employee Efficiency vs. Hour with Customer Count",
       x = "Hour of the Day",
       y = "Employee Efficiency",
       color = "Correlation",
       size = "Number of Customers") +
  theme(legend.position = "bottom")

print(final_plot)