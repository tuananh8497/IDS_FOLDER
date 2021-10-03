# Load the 'nycflights13' dataset into a frame and then find all flights that:
library(tidyverse)
library(nycflights13)

df <- flights

# 1.	Had an arrival delay of two or more hours
filter(df, arr_delay >= 120)

# 2.	Flew to Houston (IAH or HOU)
view(df)
x <- filter(df, dest == 'IAH' | dest == 'HOU')
y <- filter(df, dest %in% c('IAH','HOU'))
#z <- filter(df, dest == c('IAH','HOU')) # incorrect

# 3.	Were operated by United, American, or Delta
filter(df, carrier %in% c('UA', 'DL', 'AA'))
filter(df, carrier == 'UA' | carrier == 'DL' | carrier == 'AA')

# 4.	Departed in summer (July, August, and September)
filter(df, month %in% c(7, 8, 9))

# 5.	Arrived more than two hours late, but didn't leave late
filter(df, arr_delay > 120 & dep_delay <= 0)

# 6.	Were delayed by at least an hour, but made up over 30 minutes in flight
# filter(df, dep_delay >= 60 & arr_delay <= 30) # dep_delay = 75, arr_delay = 35,
filter(df, dep_delay>=60,dep_delay - arr_delay>30)

# 7.	Departed between midnight and 6am (inclusive)
# using the combined conditions
filter(df, dep_time >= 0 & dep_time <= 600)
# using between function
filter(df, between(dep_time, 0, 600))

# using pipe with pipe --- this is extra
df %>% filter(between(dep_time, 0, 600))

# 8.	Their departure time is not recorded (i.e. NA).
filter(df, is.na(dep_time))
