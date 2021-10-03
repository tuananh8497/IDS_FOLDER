# Week 7, Ex1:
library(tidyverse)
# read activities data
activities <- read_csv("activities.csv")
activities

# The basic problem is that we have variables stored in multiple columns 
# (location, with possible values of work, play, and talk). 
# We need to gather these columns into a single column for each variable. 

# what happens if we just gather them?
activities %>%
  gather(key = key, value = value, -id, -trt)

# Two problems appeared:
# 1- We have a single observation stored across multiple rows: we want a single row for each id x trt pairing
# 2- We have two variables stored in a single column: key contains the information on both location (work, play, and talk) as well as when the measurement was taken (T1 or T2)

# Fixing the problem of having two values in one column using separate function:
activities %>%
  gather(key = key, value = value, -id, -trt) %>%
  separate(col = key, into = c("activity", "time"))

# now the data are much tidier and much readable

# if needed you can spread the different types of measurements back into their own columns.
activities %>%
  gather(key = key, value = value, -id, -trt) %>%
  separate(col = key, into = c("activity", "time")) %>%
  spread(key = activity, value = value)

# Week 7, Ex2:

# save the results into a new tibble
tidy_activities <- activities %>%
  gather(key = key, value = value, -id, -trt) %>%
  separate(col = key, into = c("activity", "time"))

# extract summaries (mean, median, minimum, maximum):
tidy_activities %>% 
  group_by(activity) %>% 
  summarise(count= n(),
            average= mean(value, na.rm=TRUE), 
            median= median(value, na.rm=TRUE), 
            minimum= min(value, na.rm=TRUE), 
            maximum= max(value, na.rm=TRUE))
