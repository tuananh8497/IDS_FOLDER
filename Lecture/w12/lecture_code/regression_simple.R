# Q-Q Plot
nrm_data <- seq(0.01,0.99,0.01)
qs <- qnorm(nrm_data)
qqnorm(qs)

# Train a linear reression model
model <- lm(dist~ speed, data = cars)

# Plot residual
residuals <- residuals(model)
qqnorm(residuals)
qqline(residuals)
       
# Plot residual
plot(model, 2)


# prediction
predicted <- predict(model, newdata = cars)

library(tidyverse)

RMSE(cars$dist, predicted)

