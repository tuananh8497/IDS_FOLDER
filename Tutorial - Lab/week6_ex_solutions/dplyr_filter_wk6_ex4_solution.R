# Execise 4, week 6
library(nycflights13)

library(dplyr)

# extract the average departure delay for each flight carrier
flights %>% 
  group_by(carrier) %>% 
  summarise(average_delay = mean(dep_delay, na.rm = TRUE))


# extract the min and the max and the average arr_delay per arrival town (i.e. destination)
flights %>% 
  group_by(dest) %>% 
  summarise(min_delay = min(arr_delay, na.rm = TRUE),
            max_delay = max(arr_delay, na.rm = TRUE),
            average_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(dest, average_delay, fill=dest))+
  geom_bar(stat="identity")


