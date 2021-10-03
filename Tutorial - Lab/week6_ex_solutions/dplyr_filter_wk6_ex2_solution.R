# Load the 'nycflights13' dataset into a frame and then find all flights that:
library(tidyverse)
library(nycflights13)
library(dplyr)

# 1- What month had the highest proportion of cancelled flights? 
cancelled_flights <- filter(flights, is.na(air_time)) 
grouped_by_month <- group_by(cancelled_flights, month) 
counts_per_month <- summarise(grouped_by_month, count = n()) 
highest_prop <- summarise(counts_per_month, max_month= month[which.max(count)], max_value= max(count))


lowest_prop <- summarise(counts_per_month, min_month = month[which.min(count)], min_value= min(count))
average_cancelled <- summarise(counts_per_month, flight_cancelled_average = sum(count)/12)
  

# 2- What month had the lowest? 
month_with_min <- summarise(counts_per_month, month= which.min(count))
month_with_min

## TEST CUMSUM
dt <- data.table(flights)
df <- copy(flights)

with(
  df[order(df$dep_delay),],
  ave(dep_delay, carrier, year, FUN = cumsum)
)

ddply(
  df[order(df$dep_delay),],
  .(carrier, year), 
  .fun = transform, 
  cumulative_sum = (cumsum(dep_delay))
)
