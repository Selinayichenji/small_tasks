

#Simulation for 3 people's 20 friends height measurement
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

simulated_data

#test
is_numeric_edward <- all(sapply(simulated_data$Edward, is.numeric))
is_numeric_hugo <- all(sapply(simulated_data$Hugo, is.numeric))
is_numeric_lucy <- all(sapply(simulated_data$Lucy, is.numeric))
print(is_numeric_edward && is_numeric_hugo && is_numeric_lucy)

heights_in_range <- all(simulated_data >= 140 & simulated_data <= 200)
print(heights_in_range)

