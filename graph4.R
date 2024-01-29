
#Simulation
set.seed(03)
friends_num = 20

edward_height <-round(rnorm(
  n = friends_num,
  mean = 165,
  sd = 5))

hugo_height <- round(rnorm(
  n = friends_num,
  mean = 165,
  sd = 6))

lucy_height <-round(rnorm(
  n = friends_num,
  mean = 165,
  sd = 7))

simulated_data <- data.frame(Edward = edward_height, Hugo = hugo_height, Lucy = lucy_height)

#Draw the graph
library(ggplot2)
library(dplyr)
library(reshape2)

simulated_data_long <- reshape2::melt(simulated_data, variable.name = "Friend", value.name = "Height")

height_counts <- simulated_data_long %>%
  group_by(Friend, Height) %>%
  summarise(Count = n())

ggplot(height_counts, aes(x = Height, y = Count, color = Friend)) +
  geom_point(size = 3, alpha = 0.6) +
  scale_color_manual(values = c("Edward" = "red", "Hugo" = "green", "Lucy" = "blue")) +
  labs(x = "Height (cm)", y = "Number of People", color = "Measured by") +
  theme_minimal() 


