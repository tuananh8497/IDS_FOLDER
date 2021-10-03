# call required library
library(tidyverse)
library(nycflights13)
df<-flights

# Create a new dataset
flights_sml <- select(df, year:day, ends_with("delay"), distance, air_time)

# add new columns to the data frame
mutate(flights_sml, gain = dep_delay - arr_delay, speed = distance / air_time * 60)

mutate(flights_sml, gain = dep_delay - arr_delay, hours = air_time / 60, gain_per_hour = gain / hours)

transmute(flights, gain = dep_delay - arr_delay, 
          hours = air_time / 60, gain_per_hour = gain / hours)

view(arrange(df, distance))

#sort data by distance desecndingly
view(arrange(df, desc(distance)))

# Sort Data by Multipe variables
view(arrange(df, dep_time, arr_time))

# AGGREGATE (SUMMARISE)
summarise(df, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year,month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)

# extract the number of flights, average distance 
# and average delay for each destination.
delay <- summarise(by_dest, count=n(), 
                   dist = mean(distance, na.rm=TRUE), 
                   delay = mean(arr_delay, na.rm=TRUE))

# visualize to understand the relationship
ggplot(data=delay, mapping=aes(x = dist, y = delay)) +
geom_point(aes(size=count), alpha = 1/3) + 
geom_smooth()

# using pipe

dest_delay_relation3 <- flights %>% 
  group_by(dest) %>% 
  summarise(count= n(), dist= mean(distance, na.rm = TRUE), delay= mean(arr_delay, na.rm = TRUE)) %>% 
  filter(count > 20, dest != 'HNL') # the filter step is to remove the outlier

# visualise again
ggplot(data= dest_delay_relation3, mapping=aes(x= dist, y= delay)) + 
  geom_point(aes(size= count), alpha= 1/ 3) + 
  geom_smooth()

