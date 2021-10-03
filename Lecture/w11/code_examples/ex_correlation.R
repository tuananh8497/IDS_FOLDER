# correlation 
gender <- sample( c('M', 'F'), 100, replace=TRUE, prob=c(0.4, 0.6) )

calories <- abs(rnorm(100, mean = 300, sd = 200))

e1 <- rnorm(100, 0, 7)
weights <- 0.5 + 0.03 * calories + e1
# weights <- weights * 10
# weights[60] <- weights[60] +150
# weights[1:20] <- weights[1:20] * exp(weights[1:20]/10)
summary(weights)

library(tidyverse)
df1 <- tibble(gender, calories, weights)


ggplot(df1, aes(x = calories, y = weights)) + 
  geom_point() #+
  #stat_smooth(method = "lm", col = "red")

r1 <- cor(calories, weights)


e2 <- rnorm(100, 0, 20)
weights <- 0.5 + 0.03 * calories + e2
df2 <- tibble(gender, calories, weights)
ggplot(df2, aes(x = calories, y = weights)) + 
  geom_point()

r2 <- cor(calories, weights)


e3 <- rnorm(100, 0, 6)
weights <- 0.5 + 0.03 * calories + e3
df2 <- tibble(gender, calories, weights)
ggplot(df2, aes(x = calories, y = weights)) + 
  geom_point()

r3 <- cor(calories, weights)

# unitless
r3 <- cor(calories, weights * 10)
