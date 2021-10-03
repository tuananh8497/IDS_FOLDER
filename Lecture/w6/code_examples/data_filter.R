# call the required libraries
library(tidyverse)
# install.packages("nycflights13")
library(nycflights13)
df <- flights
# filter based on conditions
filter(df, df$month == 1, df$day == 1)
filter(df, month == 12, day == 25)
# you may combine conditions using logical operators
filter(df, month == 1 | month == 12)
# or by combining variables in vector
filter(df, month %in% c(11, 12))
# comma means and (&)
# for example, extract all records for flights, that were not delayed (arr and dep) more than 2 hrs
filter(flights, arr_delay <= 120, dep_delay <= 120)
