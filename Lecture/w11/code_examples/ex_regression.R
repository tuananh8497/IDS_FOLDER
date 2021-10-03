# linear regression example

library(tidyverse)
?cars
glimpse(cars)

# visually inspect the relationship

# scatterplot
ggplot(data= cars, mapping= aes(x = speed, y = dist))+
  geom_point()+
  geom_smooth(method=lm)

# boxplot per variable
ggplot(data= cars, mapping= aes(x = "speed", y = speed))+
  geom_boxplot()

ggplot(data= cars, mapping= aes(x = "dist", y = dist))+
  geom_boxplot()

# boxplot of the two variables
# first we gather the data
cars %>% 
  gather() %>% 
  ggplot(mapping = aes(x = key, y = value, fill= key))+
    geom_boxplot()

# Numerically
cor(cars$speed, cars$dist)

# fit regression line to predict cars's stopping distances from cars's speed
model <- lm(dist ~ speed, data = cars)
model
