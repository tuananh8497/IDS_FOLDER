# call the required libraries
library(tidyverse)
library(nycflights13)
df <- flights
# Select columns by name 
select(flights, year, month, day) 
# Select all columns between year and day (inclusive) 
select(flights, year:day) 
# Select all columns except those from year to day (inclusive) 
select(flights, -(year:day)) 
# rename() is a variant of select() that keeps all the variables that aren't explicitly mentioned: 
rename(flights, tail_num = tailnum) 
# Move a variable to the start of the data frame. 
select(flights, time_hour, air_time, everything()) 
