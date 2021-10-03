# Introduction to Data Science (11372), Semester 1 2021
# Tuan Anh (Vincent) Nguyen - u3196825
# The code here is for the assignment purpose.

##################################################
##################### Part A ##################### 
##################################################

# install tidyverse if it is not installed
if (!("tidyverse" %in% rownames(installed.packages()))){
  install.packages("tidyverse")
  install.packages('plyr')
}
# load the tidyverse library
library("tidyverse")
library(plyr)
library(dplyr)
library(readr)
library(lubridate)

# 1. Load these file into your working dir, one by one
data_dir <- "data"
files <- list.files(path=data_dir, pattern = "*.csv", full.names = TRUE)
files
# 2. Concatenate all the data of these files into 1 data frame. May use loop statement to archieve that
# read the files one by one and append the new rows (skip the first 7 rows),
# change the date format of Column "Date"
df <- data.frame()
for (i in 1:length(files)){
  temp <- read_csv(files[i], na='-',skip = 7,col_types = cols(Date = col_date(format = "%d/%m/%Y")))
  df <- rbind(df, temp)
}
df

# 3. Check for problem while loading and parsing the data
# check for problems
# Inspect the structure of data project
spec(df)

problems(df)

# assert that there is no problem
assertthat::assert_that(nrow(problems(df)) == 0, 
                        msg="There is still problem/s, which you need to fix first")

# Replace all "Calm" value in the 9am/3pm wind speed with 0 (see ref)
# ref: http://www.bom.gov.au/marine/knowledge-centre/reference/wind.shtml
df$`3pm wind speed (km/h)` <- gsub("Calm", "0", df$`3pm wind speed (km/h)`) # Change Calm -> 0
df$`9am wind speed (km/h)` <- gsub("Calm", "0", df$`9am wind speed (km/h)`) # Change Calm -> 0
df$`3pm wind speed (km/h)` <- sapply(df$`3pm wind speed (km/h)`, as.numeric) # Convert the columns from chr to numeric
df$`9am wind speed (km/h)` <- sapply(df$`9am wind speed (km/h)`, as.numeric) # Convert the columns from chr to numeric

# assert that there is no problem
assertthat::assert_that(nrow(problems(df)) == 0, 
                        msg="There is still problem/s, which you need to fix first")

##################################################
##################### Part B ##################### 
##################################################

# 1. Remove the variables, which have no data at all (all the records in these variables are NAs)
df_1 <- df[ , colSums(is.na(df)) < nrow(df) ]
df_1
# 2. Drop the variables, which have few data  (NAs values are more than 90% of number of records in these variables) 
colSums(is.na(df_1)) # Get the sum of NA values in each table
df_1 <- df_1[, which(colMeans(!is.na(df_1)) > 0.9)] # remove variables with 90% NAs
colSums(is.na(df_1))
# 3. Change the column names to replace space with underscore the "_" character
colnames(df_1) <- gsub(" ", "_", colnames(df_1))
colnames(df_1)

# 4. Add 2 news columns (Month, Year) of the data in each file from the column "DATE" 
data_tidier <- df_1 %>% 
  separate(Date, into = c("Year", "Month"), sep = "\\-", convert = TRUE)

data_tidier
# 5. Change the type of the "Month" and "Year" columns from Character to Ordinal with levels as the number of months in a year
data_tidier$Month <- parse_integer(data_tidier$Month)
data_tidier$Month <- factor(data_tidier$Month, order = TRUE, levels =c(1:12))

data_tidier$Year <-  parse_integer(data_tidier$Year)
data_tidier$Year <- factor(data_tidier$Year, order = TRUE, levels =c(2018, 2019, 2020))

# Check to see if the Ordinal worked! Summary the number of Month and Year.
summary(data_tidier$Month)
summary(data_tidier$Year)

# 6. For all numeric columns, replace the remaining NAs with the median of values in the columns, if exist

dt <- as_tibble(data_tidier) # Clone from previous step

# I did test out several ways but stuck at keep original df 
# while modify the numeric col only, and it include mean calculating as well
# Dirty Code for unsolved problem with loop, Sorry if it is hurt your eyes.
# The code go through all numerical cols and replace NAs value with median of the columns.
dt$Minimum_temperature[is.na(dt$Minimum_temperature)] <- median(dt$Minimum_temperature, na.rm = TRUE)
dt$Maximum_temperature[is.na(dt$Maximum_temperature)] <- median(dt$Maximum_temperature, na.rm = TRUE)
dt$`Rainfall_(mm)`[is.na(dt$`Rainfall_(mm)`)] <- median(dt$`Rainfall_(mm)`, na.rm = TRUE)
dt$`Speed_of_maximum_wind_gust_(km/h)`[is.na(dt$`Speed_of_maximum_wind_gust_(km/h)`)] <- median(dt$`Speed_of_maximum_wind_gust_(km/h)`, na.rm = TRUE)
dt$`9am_Temperature`[is.na(dt$`9am_Temperature`)] <- median(dt$`9am_Temperature`, na.rm = TRUE)
dt$`9am_relative_humidity_(%)`[is.na(dt$`9am_relative_humidity_(%)`)] <- median(dt$`9am_relative_humidity_(%)`, na.rm = TRUE)
#dt$`9am_cloud_amount_(oktas)`[is.na(dt$`9am_cloud_amount_(oktas)`)] <-median(dt$`9am_cloud_amount_(oktas)`, na.rm = TRUE)
dt$`9am_wind_speed_(km/h)`[is.na(dt$`9am_wind_speed_(km/h)`)] <- median(dt$`9am_wind_speed_(km/h)`, na.rm = TRUE)
dt$`9am_MSL_pressure_(hPa)`[is.na(dt$`9am_MSL_pressure_(hPa)`)] <- median(dt$`9am_MSL_pressure_(hPa)`, na.rm = TRUE)
dt$`3pm_Temperature`[is.na(dt$`3pm_Temperature`)] <-  median(dt$`3pm_Temperature`, na.rm = TRUE)
dt$`3pm_relative_humidity_(%)`[is.na(dt$`3pm_relative_humidity_(%)`)] <- median(dt$`3pm_relative_humidity_(%)`, na.rm = TRUE)
#dt$`3pm_cloud_amount_(oktas)`[is.na(dt$`3pm_cloud_amount_(oktas)`)] <- median(dt$`3pm_cloud_amount_(oktas)`, na.rm = TRUE)
dt$`3pm_wind_speed_(km/h)`[is.na(dt$`3pm_wind_speed_(km/h)`)] <- median(dt$`3pm_wind_speed_(km/h)`, na.rm = TRUE)
dt$`3pm_MSL_pressure_(hPa)`[is.na(dt$`3pm_MSL_pressure_(hPa)`)] <- median(dt$`3pm_MSL_pressure_(hPa)`, na.rm = TRUE)

# check any NA values left in the cols
dt <- na.omit(dt) # by now, only one row with NA value left, which is fine to remove it
sum(is.na(dt)) # sum of NAs in data, if = 0 <--> FINISHED WRANGLING
dt_finished <- as_tibble(dt)

##################################################
##################### Part C ##################### 
##################################################

# 1. Printing the summary (minimum, median, mean, maxiumum) of each of the following variables:
# Minimum_temperature
summary(dt_finished$Minimum_temperature)
# Maximum_temperature
summary(dt_finished$Maximum_temperature)
# 9am_Temperature
summary(dt_finished$`9am_Temperature`)
# 3pm_Temperature
summary(dt_finished$`3pm_Temperature`)
# Speed_of_maximum_wind_gust_(km/h)
summary(dt_finished$`Speed_of_maximum_wind_gust_(km/h)`)

# 2. Extracting the average of minimum temperature per month and year.
dt_finished %>% 
  group_by(Year, Month, Minimum_temperature) %>% 
  summarise(avg_min_temp = mean(Minimum_temperature, na.rm = TRUE)) 

# 3. Extracting the average of maximum temperature per month and year.
dt_finished %>% 
  group_by(Year, Month, Maximum_temperature) %>% 
  summarise(avg_max_temp = mean(Maximum_temperature, na.rm = TRUE)) 

# 4. Extracting the average of speed of maximum wind gust per direction of maximum wind gust.
dt_finished %>% 
  group_by(., Direction_of_maximum_wind_gust) %>% 
  summarise(avg_speed_maximum_wind_gust = mean(`Speed_of_maximum_wind_gust_(km/h)`))

# 5. Which month has the highest rain fall quality? And in which year?
highest_rain_fall_by_month <- dt_finished %>% 
  group_by(Month) %>% 
  slice(which.max(`Rainfall_(mm)`)) %>% 
  select(Year, Month, `Rainfall_(mm)`)

# Get the highest rain_fall month from the list
highest_rain_fall_by_month[which.max(highest_rain_fall_by_month$`Rainfall_(mm)`), ]


# 6. Which months were dry, if any, (i.e. no rainfall at all), And in which year?
by_month_year_rainfall <- dt_finished %>% 
  group_by(Year, Month) %>% 
  filter(`Rainfall_(mm)`== 0) %>% 
  select(Year, Month) %>% 
  count(.) %>% 
  filter(freq > 24) # Filter months in each year which have more than 24 days without rain

by_month_year_rainfall

# 7. What about the humidity, which month in the ACT 
# has the highest humidity level in the 2019
humidity_by_month_2019 <- dt_finished %>% 
  group_by(Year, Month) %>% 
  filter(Year == 2019) %>% 
  select(Year ,Month, `9am_relative_humidity_(%)`, `3pm_relative_humidity_(%)`) %>% 
  mutate(avg_humidity = (`9am_relative_humidity_(%)` + `3pm_relative_humidity_(%)`) / 2) %>% 
  slice(which.max(avg_humidity)) %>% 
  summarise(Month = Month[which.max(avg_humidity)], 
            Value = avg_humidity[which.max(avg_humidity)])
  
humidity_by_month_2019 

# 8. For 2019, extract the min, max, avg, temperature, wind speed and humidity per month and per quarter in 2019 only.

# Create new quarter column
month_quarter_2019 <- dt_finished %>% 
  group_by(Year, Month) %>% 
  filter(Year == 2019) %>% 
  mutate(Quarter = ceiling(as.numeric(Month) / 3))

# Ordinal Converter for Quarter
month_quarter_2019$Quarter <- parse_integer(month_quarter_2019$Quarter)
month_quarter_2019$Quarter <- factor(month_quarter_2019$Quarter, order = TRUE, levels =c(1:4))

# Temperature (Min > Max > AVG)
## Temperature By Month
min_temperature_by_month <- month_quarter_2019 %>% 
  group_by(Month) %>% 
  slice(which.min(Minimum_temperature)) %>% 
  select(Month, min_temp_month = Minimum_temperature)
  
max_temperature_by_month <- month_quarter_2019 %>% 
  group_by(Month) %>% 
  slice(which.max(Maximum_temperature)) %>% 
  select( Month, max_temp_month = Maximum_temperature)

# I calculate the average daily temperature by (min_temp + max_temp) / 2 and get mean by month.
avg_temperature_by_month <- month_quarter_2019 %>% 
  group_by(Month) %>% 
  mutate(avg_daily_temp = (Maximum_temperature + Minimum_temperature) / 2) %>% 
  aggregate( avg_daily_temp ~ Month, . , mean ) %>% 
  select( Month, avg_temp_month = avg_daily_temp )

# Merge into 1 table
temp_month <- do.call("cbind", list(min_temperature_by_month, max_temperature_by_month, avg_temperature_by_month))
colnames(temp_month)[1] <- "Month"
temp_month <-  temp_month[c(1, 2, 4, 6)]

## Temperature By Quarter
min_temperature_by_quarter <- month_quarter_2019 %>% 
  group_by(Quarter) %>% 
  slice(which.min(Minimum_temperature)) %>% 
  select(Quarter, min_temp_quarter = Minimum_temperature)

max_temperature_by_quarter <- month_quarter_2019 %>% 
  group_by(Quarter) %>% 
  slice(which.max(Maximum_temperature)) %>% 
  select( Quarter, max_temp_quarter = Maximum_temperature)

avg_temperature_by_quarter <- month_quarter_2019 %>% 
  group_by(Quarter) %>% 
  mutate(avg_daily_temp = (Maximum_temperature + Minimum_temperature) / 2) %>% 
  aggregate( avg_daily_temp ~ Quarter, . , mean ) %>% 
  select( Quarter, avg_temp_quarter = avg_daily_temp )

temp_quarter <- do.call("cbind", list(min_temperature_by_quarter, max_temperature_by_quarter, avg_temperature_by_quarter))
colnames(temp_quarter)[1] <- "Quarter"
temp_quarter <-  temp_quarter[c(1, 2, 4, 6)]

# Wind_Speed (Min > Max > AVG)
# Due to Wind Speed has 2 variable, one in 9am and the other 3pm so I calculate the average speed daily to find min max.
avg_wind_speed_daily <- month_quarter_2019 %>% 
  group_by(Month) %>% 
  mutate(avg_daily_windspeed = (`9am_wind_speed_(km/h)` + `3pm_wind_speed_(km/h)`) / 2) %>% 
  select(. , Quarter, Month, `9am_wind_speed_(km/h)`,`3pm_wind_speed_(km/h)`, avg_daily_windspeed)

## Wind Speed By Month
min_wind_speed_by_month <- avg_wind_speed_daily %>% # Get Min wind speed from daily average per month
  group_by(Month) %>% 
  slice(which.min(avg_daily_windspeed)) %>% 
  select( Month, min_ws_month = avg_daily_windspeed)
  
max_wind_speed_by_month <- avg_wind_speed_daily %>% # Get Max wind speed from daily average per month
  group_by(Month) %>% 
  slice(which.max(avg_daily_windspeed)) %>% 
  select( Month, max_ws_month = avg_daily_windspeed)

avg_wind_speed_by_month <- avg_wind_speed_daily %>% # Get average wind speed per month from daily average wind_speed
  group_by(Month) %>% 
  aggregate( avg_daily_windspeed ~ Month, . , mean ) %>% 
  select( Month, avg_ws_month = avg_daily_windspeed )
  
# Merge into 1 table
ws_month <- do.call("cbind", list(min_wind_speed_by_month, max_wind_speed_by_month, avg_wind_speed_by_month))
colnames(ws_month)[1] <- "Month"
ws_month <-  ws_month[c(1, 2, 4, 6)]

## Wind Speed By Quarter
min_wind_speed_by_quarter <- avg_wind_speed_daily %>% 
  group_by(Quarter) %>% 
  slice(which.min(avg_daily_windspeed)) %>% 
  select(Quarter, min_ws_quarter = avg_daily_windspeed)

max_wind_speed_by_quarter <- avg_wind_speed_daily %>% 
  group_by(Quarter) %>% 
  slice(which.max(avg_daily_windspeed)) %>% 
  select( Quarter, max_ws_quarter = avg_daily_windspeed)

avg_ws_by_quarter <- avg_wind_speed_daily %>% 
  group_by(Quarter) %>% 
  aggregate( avg_daily_windspeed ~ Quarter, . , mean ) %>% 
  select( Quarter, average_ws_quarter = avg_daily_windspeed )

ws_quarter <- do.call("cbind", list(min_wind_speed_by_quarter, max_wind_speed_by_quarter, avg_ws_by_quarter))
colnames(ws_quarter)[1] <- "Quarter"
ws_quarter <-  ws_quarter[c(1, 2, 4, 6)]

# Humidity (Min > Max > AVG)
avg_humidity_daily <- month_quarter_2019 %>% 
  group_by(Month) %>% 
  mutate(avg_daily_humidity = (`9am_relative_humidity_(%)` + `3pm_relative_humidity_(%)`) / 2) %>% 
  select(. , Quarter, Month, `9am_relative_humidity_(%)`,`3pm_relative_humidity_(%)`, avg_daily_humidity)

## Humidity By Month
min_humidity_by_month <- avg_humidity_daily %>% # Get Min Humidity from daily average per month
  group_by(Month) %>% 
  slice(which.min(avg_daily_humidity)) %>% 
  select( Month, min_humid_month = avg_daily_humidity)

max_humidity_by_month <- avg_humidity_daily %>% # Get Max Humidity from daily average per month
  group_by(Month) %>% 
  slice(which.max(avg_daily_humidity)) %>% 
  select( Month, max_humid_month = avg_daily_humidity)

avg_humidity_by_month <- avg_humidity_daily %>% # Get average Humidity per month from daily average avg_humidity_daily
  group_by(Month) %>% 
  aggregate( avg_daily_humidity ~ Month, . , mean ) %>% 
  select( Month, average_humid_month = avg_daily_humidity )

# Merge into 1 table
humid_month <- do.call("cbind", list(min_humidity_by_month, max_humidity_by_month, avg_humidity_by_month))
colnames(humid_month)[1] <- "Month"
humid_month <-  humid_month[c(1, 2, 4, 6)]



## Humidity By Quarter
min_humidity_by_quarter <- avg_humidity_daily %>% # Get Min Humidity from daily average per Quarter
  group_by(Quarter) %>% 
  slice(which.min(avg_daily_humidity)) %>% 
  select( Quarter, min_humid_quarter = avg_daily_humidity)

max_humidity_by_quarter <- avg_humidity_daily %>% # Get Max Humidity from daily average per Quarter
  group_by(Quarter) %>% 
  slice(which.max(avg_daily_humidity)) %>% 
  select( Quarter, max_humid_quarter = avg_daily_humidity)

avg_humidity_by_quarter <- avg_humidity_daily %>% # Get average Humidity per Quarter from daily avg_humidity_daily
  group_by(Quarter) %>% 
  aggregate( avg_daily_humidity ~ Quarter, . , mean ) %>% 
  select( Quarter, average_humid_quarter = avg_daily_humidity )

# Merge into 1 table
humid_quarter <- do.call("cbind", list(min_humidity_by_quarter, max_humidity_by_quarter, avg_humidity_by_quarter))
colnames(humid_quarter)[1] <- "Quarter"
humid_quarter <-  humid_quarter[c(1, 2, 4, 6)]

# Print the min, max, avg of temp, wind speed, humid per month, quarter
temp_month
temp_quarter
ws_month
ws_quarter
humid_month
humid_quarter

# Save to csv file
write.csv(dt_finished, "data/dt_finished.csv")
# Plot the histogram / bar-charts for each variable of the previous question.




