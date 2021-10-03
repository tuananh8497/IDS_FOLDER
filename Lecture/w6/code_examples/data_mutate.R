# call the required libraries
library(tidyverse)
library(nycflights13)
df <- flights
# Create a new dataset 
flights_sml <- select(df, year:day, ends_with("delay"), distance, air_time ) 
flights_sml

# add new columns to the data frame
mutate(flights_sml, gain = dep_delay - arr_delay, speed = distance / air_time * 60 ) 
# Note that you can refer to columns that you've just created: 
mutate(flights_sml, gain = dep_delay - arr_delay, hours = air_time / 60, gain_per_hour = gain / hours ) 
# If you only want to keep the new variables, use transmute(): 
transmute(flights, gain = dep_delay - arr_delay, hours = air_time / 60, gain_per_hour = gain / hours ) 
