library(tidyverse)

# read data 
weather_data <- read_csv("weather_data.csv")

# select 2019 data only
weather_data_2019 <- filter(weather_data, year==2019)

# computer average temperature from the minimumn and maximum
weather_data_2019 <- weather_data_2019 %>% 
  mutate(average_temperature= 0.5 * (Minimum_temperature + Maximum_temperature))

# group by month and extract the min, max, avg
weather_data_2019_metrics <- weather_data_2019 %>% 
  group_by(month) %>% 
  summarise(min = min(Minimum_temperature, na.rm = TRUE),
            max = max(Maximum_temperature, na.rm = TRUE),
            avg = mean(average_temperature,na.rm = TRUE))
  

# convert these data to a long format
weather_data_2019_metrics_long <- weather_data_2019_metrics %>% 
  gather(metric, value, -month)

months_order = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# Visualise the metrics per month
weather_data_2019_metrics_long %>% 
  ggplot(aes(x = month, y= value, group= metric, colour= metric))+
    scale_x_discrete(limits=months_order)+  
    geom_point() +
    geom_line() +
    ggtitle("The average, minimum and maximum temperature in 2019")
  