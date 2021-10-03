# Load the 'nycflights13' dataset into a frame and then find all flights that:
library(tidyverse)
library(nycflights13)

# 1- What plane (specified by the `tailnum` variable) traveled
## the most times from New York City airports in 2013?
flights$tailnum
# group and count and then get the maximum with respect to the tailnum variable
# we may first get rid of the cancelled flights
flights %>% 
  filter(!is.na(air_time)) %>% 
  group_by(tailnum) %>% 
  summarise(count = n()) %>% 
  summarise(plane= tailnum[which.max(count)], times= count[which.max(count)])

flights %>% 
  filter(!is.na(air_time)) %>% 
  group_by(tailnum) %>% 
  summarise(count = n()) %>% 
  summarise(plane= tailnum[which.min(count)], times= count[which.min(count)])

# 2- Plot the number of trips per week over the year.
flights$time_hour # this is a date time format, then I can use lubridate package
library(lubridate)
# add another column for the week of the flight
library(lubridate)
df <- flights
trips <- df %>% 
  mutate(week= week(time_hour)) %>% 
  group_by(week) %>% 
  summarise(count = n())

# plot a barchart
ggplot(data= trips, aes(x= week, y= count)) + 
  geom_bar(stat="identity")
