# call the required libraries
library(tidyverse)
library(nycflights13)
df <- flights
# sort data by distance 
arrange(df, distance) 
# sort data by distance descendingly 
arrange(df, desc(distance)) 
# Sort Data by Multiple Variables 
arrange(df, dep_time, arr_time) 