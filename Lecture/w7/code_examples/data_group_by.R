library(tidyverse)
library(nycflights13)
# group the data of the flights by the date 
by_day <- group_by(flights, year, month, day) 
# get the average delay per day 
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE)) 

# Imagine that we want to explore the relationship between the distance and 
# average delay for each location. 
by_dest <- group_by(flights, dest) 
# extract the number of flights, average distance and average delay for each destination 
dest_delay_relation <- summarise(by_dest, count= n(), dist= mean(distance, na.rm = TRUE), delay= mean(arr_delay, na.rm = TRUE) ) 
# visualise to understand the relationship 
ggplot(data= dest_delay_relation, mapping=aes(x= dist, y= delay)) + 
  geom_point(aes(size= count), alpha= 1/ 3) + 
  geom_smooth()

dest_delay_relation2 <- filter(dest_delay_relation, count > 20, dest != 'HNL')
# visualise again
ggplot(data= dest_delay_relation2, mapping=aes(x= dist, y= delay)) + 
  geom_point(aes(size= count), alpha= 1/ 3) + 
  geom_smooth()


# using pipe:
dest_delay_relation3 <- flights %>%  
  group_by(dest) %>% 
  summarise(count= n(), dist= mean(distance, na.rm = TRUE), delay= mean(arr_delay, na.rm = TRUE)) %>% 
  filter(count > 20, dest != 'HNL') # the filter step is to remove the outlier

# visualise again
ggplot(data= dest_delay_relation3, mapping=aes(x= dist, y= delay)) + 
  geom_point(aes(size= count), alpha= 1/ 3) + 
  geom_smooth()
