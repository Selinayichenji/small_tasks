

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
