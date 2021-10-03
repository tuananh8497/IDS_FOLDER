# linear regression

# libraries
library(tidyverse)
library(modelr)
library(broom)

advertising <- read_csv("data/Advertising.csv") %>%
  select(-X1)

# data preparation

# split data into 60% training and 40% testing

set.seed(123)
sample <- sample(c(TRUE, FALSE), nrow(advertising), replace = T, prob = c(0.6,0.4))
train <- advertising[sample, ]
test <- advertising[!sample, ]

train

test

# linear regression between two variables (x and y)
simple_model <- lm(sales ~ TV, data = train)

# asess the model structure
summary(simple_model)
tidy(simple_model)
sigma(simple_model)


ggplot(train, aes(TV, sales)) +
  geom_point() +
  geom_smooth(method = "lm") +
  geom_smooth(se = FALSE, color = "red")
