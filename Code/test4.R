parse_date("3 September, 2019", format="%d %B, %Y")

parse_date("January 1, 2010", format="%B %d, %Y")

parse_date("Dec 30, 2014", format="%b %d, %Y")

parse_date("2018-May-07", format="%Y-%b-%d")

library(tidyverse)

library(nycflights13)



flights %>% 
  group_by(dep_delay, dest) %>% 
  summarise(average_delay = dep_delay/dest)

