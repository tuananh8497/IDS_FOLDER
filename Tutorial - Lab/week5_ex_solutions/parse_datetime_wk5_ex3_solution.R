# wk5, Ex3
# parse date
library(tidyverse)
d1 <- "January 1, 2010"
parse_date(d1, format="%B %d, %Y")
d2 <- "2015-Mar-07"
parse_date(d2, format="%Y-%b-%d")
d3 <- "06-Jun-2017"
parse_date(d3, format="%d-%b-%Y")
d4 <- c("August 19 (2015)", "July 1 (2015)")
parse_date(d4, format="%B %d (%Y)")
d5 <- "12/30/14" # Dec 30, 2014
parse_date(d5, format="%m/%d/%y")
t1 <- "1705"
parse_time(t1, format="%H%M")
t2 <- "11:15:10.12 PM"
parse_time(t2, format="%I:%M:%OS %p")
