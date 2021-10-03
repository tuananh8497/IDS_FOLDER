library(tidyverse)
library(nycflights13)

data <- flights

#1. Had an arrival delay of two or more hours
filter(data, arr_delay >= 2)

#2. Flew to Houston (IAH or HOU)
filter(data, dest == "IAH" | dest == "HOU")

#3. Were operated by United, American, or Delta
filter(data, carrier == "UA" | carrier == "AA" | carrier == "DL")

#4. Departed in summer (July, August, and September)
filter(data, month == 7 | month == 8 | month == 9)
filter(data, month %in% c(7,8,9,10))

#5. Arrived more than two hours late, but didn't leave late
filter(data, dep_delay <= 0 & arr_delay >= 2)

# 6. Were delayed by at least an hour, but made up over 30 minutes in flight
filter(data, dep_delay>=60,dep_delay - arr_delay>30)

# 7. Departed between midnight and 6am (inclusive)
filter(data, dep_time >= 0 & dep_time <= 600)

# 8. Their departure time is not recorded (i.e. NA). -> using is.na
filter(data, is.na(dep_time))

