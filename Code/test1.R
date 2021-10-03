library(tidyverse)
library(nycflights13)

df<-flights

# filter based on conditions
filter (df, month ==1, day ==1)
filter(df, month == 4, day == 8)

# combine conditions using logical operators
filter(df, month == 1 | month==12)

# combine variables in vector
filter(df, month %in% c(11,12))

#comma means and (&)

#for example, extract all records for flights, that were not delayed 
# (arr and dep) and more than 2 hrs.
filter(flights, arr_delay <= 120, dep_delay <= 120)

# Select columns by name
select(flights, year, month, day)

select(flights, month, year)

select(flights, -(year:day))

# rename() is a variant of select() that keeps all the variables
# that aren't explicitly mentioned
rename(flights, tail_num = tailnum)

select(flights, time_hour, air_time, everything())
