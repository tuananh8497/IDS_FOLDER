# week 11, solutions of the exercises (2 - 4)

library(tidyverse)

### exercise 2

data <- read_csv("data/Advertising.csv") 
data
# remove unnamed variable (i.e. the first column)
data <- data[-1]

# Check the summary of sales
summary(data$sales)
# --------------------------------------

### exercise 3

# plot scatter plot between the sales and each of the other variables in the data
ggplot(data, aes(x = TV, y = sales)) +
  geom_point()

ggplot(data, aes(x = newspaper, y = sales)) +
  geom_point()

ggplot(data, aes(x = radio, y = sales)) +
  geom_point()

# add the regression line using stat_smooth(method = lm) to the graphs
ggplot(data, aes(x = TV, y = sales)) +
  geom_point()+
  stat_smooth(method = lm)

ggplot(data, aes(x = newspaper, y = sales)) +
  geom_point()+
  stat_smooth(method = lm)

ggplot(data, aes(x = radio, y = sales)) +
  geom_point()+
  stat_smooth(method = lm)

# compute the correlation of the sales variable with each of the other variables independently
cor(data$sales, data$TV)

cor(data$sales, data$radio)

cor(data$sales, data$newspaper)

# Generate the correlation matrix for all of the variables together
# Correlation Matrix
cor(data)
# visualise the correlation matrix using ggcorr function
install.packages("GGally")
library(GGally)
ggcorr(data, label = TRUE, label_alpha = TRUE)
# --------------------------------------

### exercise 4
# using the correlation as a test
res <- cor.test(data$sales, data$TV, 
                method = "pearson")
res
# We look to the p-value and the cor value

# Extract the p.value
res$p.value

# Extract the correlation coefficient
res$estimate
# --------------------------------------

# ### exercise 4, 
# 
# # checking the the normality assumption visually using QQ-plot
# # i.e. if the generated points are mostly aligned with the line, then it shows that the points are generated from a normal distribution. 
# 
# install.packages("ggpubr")
# library(ggpubr)
# 
# ggqqplot(data=data, x = "sales")
# 
# ggqqplot(data$TV, ylab = "TV")
# 
# ggqqplot(data$TV, ylab = "radio")
# 
# ggqqplot(data$TV, ylab = "newspaper")
# # --------------------------------------
