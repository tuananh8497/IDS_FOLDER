# example on usa_housing.csv dataset.
# the data has been downloaded from kaggle
# https://www.kaggle.com/aariyan101/usa-housingcsv/

library(tidyverse)

# read data
data <- read_csv("data/USA_Housing.csv")
head(data)

# plot density plot for the response variable (i.e. Price) to check its distribution
# It would be good if the response variable follows normal distribution.
ggplot(data, aes(Price)) +
  geom_histogram(aes(y = ..density..), fill = "aquamarine3") +
  geom_density(color = "red")

cor(data)
# show correlation matrix to check the correlation
install.packages("GGally")
library(GGally)
ggcorr(data, label = TRUE, label_alpha = TRUE)

# another way to plot the correlation
# Make the graph, with reduced margins
install.packages("ellipse")
library(ellipse)
ctab <- cor(data)

plotcorr(ctab, mar = c(0.1, 0.1, 0.1, 0.1))

# Do the same, but with colors corresponding to value
colorfun <- colorRamp(c("#CC0000","white","#3366CC"), space="Lab")
plotcorr(ctab, col=rgb(colorfun((ctab+1)/2), maxColorValue=255),
         mar = c(0.1, 0.1, 0.1, 0.1))


# show box plot to all of the variables to check the outliers
meltData <- data %>% 
  gather()

p <- ggplot(meltData, aes(key, value)) 
p + geom_boxplot() # not so good as the scale of the variables is different 

p + geom_boxplot() + facet_wrap(~key, scale="free")

# split data into train and test
install.packages("caret")
library(caret)
index <- createDataPartition(data$Price, p = .70, list = FALSE)
length(data$Price)

train <- data[index, ]
test <- data[-index, ]

dim(train)
dim(test)

# build a model1 only between price and the variable with highest correlation with price (i.e. Area_income)
lmModel1 <- lm(Price ~ Area_Income , data = train)
print(lmModel1)

# Validating Regression Coefficients and Models
summary(lmModel1)

# visualise the model
plot(lmModel1)


# predicting
test$PreditedPrice_1 <- predict(lmModel1, test)
head(test[ , c("Price", "PreditedPrice_1")])

# compute the residual mean square error (RMSE) as a way of evaluation
preds <-  test$PreditedPrice_1
actual <- test$Price

RMSE(preds, actual)

# build a linear model between the price and all of the other variables
lmModel2 <- lm(Price ~ . , data = train)
print(lmModel2)

# Validating Regression Coefficients and Models
summary(lmModel2)

# predicting
test$PreditedPrice_2 <- predict(lmModel2, test)
head(test[ , c("Price", "PreditedPrice_1",  "PreditedPrice_2")])

# RMSE
actual <- test$Price
preds <- test$PreditedPrice_2

RMSE(preds, actual)
plot(lmModel2)

# post assumptions
# Visualise the distribution of the residuals for both of the models
hist(lmModel1$residuals, color = "grey")

hist(lmModel2$residuals, color = "grey")

ggplot(lmModel1, aes(lmModel1$residuals)) +
  geom_histogram(aes(y = ..density..), fill = "#C99800") +
  geom_density(color = "blue")

ggplot(lmModel2, aes(lmModel2$residuals)) +
  geom_histogram(aes(y = ..density..), fill = "#00BCD8") +
  geom_density(color = "red")

