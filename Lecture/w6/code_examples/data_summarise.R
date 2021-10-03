# call the required libraries
library(tidyverse)
library(nycflights13)
df <- flights
# extract a statistical metric from variable / variables of the data 
summarise(df, delay = mean(dep_delay, na.rm = TRUE))
