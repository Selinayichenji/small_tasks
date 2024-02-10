

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

# 5 tests

# Check if Hours and Customers are integers
test_efficiency_integer <- all(sapply(frame[, c("Hour", "Customers")], function(x) all(x == floor(x))))
print(paste("Hours and Customers are integers:", test_efficiency_integer))

# Check if there are data for all hours between 9 AM and 4 PM
test_hours_complete <- all(frame$Hour >= 9 & frame$Hour <= 16)
print(paste("Data for all hours between 9 AM and 4 PM:", test_hours_complete))

# Check the correlation between customers and positive efficiency
correlation_customers_efficiency_pos <- cor(frame$Customers, frame$Efficiency_Positive)
test_correlation_pos <- correlation_customers_efficiency_pos > 0
print(paste("Customers and positive efficiency are positively correlated:", test_correlation_pos))

# Check the correlation between customers and negative efficiency
correlation_customers_efficiency_neg <- cor(frame$Customers, frame$Efficiency_Negative)
test_correlation_neg <- correlation_customers_efficiency_neg < 0
print(paste("Customers and negative efficiency are negatively correlated:", test_correlation_neg))

# Check for missing data in the dataset
test_no_missing <- !any(is.na(frame))
print(paste("No missing data in the dataset:", test_no_missing))

