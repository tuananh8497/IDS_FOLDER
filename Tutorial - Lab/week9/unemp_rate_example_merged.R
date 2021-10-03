##############################################################
# in this exercise we practice how to put the data 
# from different files into tidy format, so we facilitate 
# the analysis or visualization
##############################################################

library(tidyverse)

# data files
female_file <- "data/1978-2017-australiansdg-indicator-8-5-2a-females.csv"
male_file <- "data/1978-2017-australiansdg-indicator-8-5-2a-males.csv"

# load the data files
female_data <- read_csv(female_file, na = '-')
male_data <- read_csv(male_file, na = '-')
###############################

# Tide the data for each file separately:
###############################

# for female data
female_data <- female_data %>% 
  separate(col = Month, into = c("Month", "Year"), sep = "\\-")

# swap year and month for some rows
temp <- female_data$Year[24:length(female_data$Year)]

female_data$Year[24:length(female_data$Year)] <- 
  female_data$Month[24:length(female_data$Month)]

female_data$Month[24:length(female_data$Month)] <- temp

female_data$Year <- parse_integer(female_data$Year)

# change to complete year format
female_data$Year[female_data$Year > 17 ] = 
  female_data$Year[female_data$Year > 17] + 1900
female_data$Year[female_data$Year <= 17] = 
  female_data$Year[female_data$Year <= 17] + 2000

# gather 
female_data <- female_data %>% 
  gather(agegroups, unemployment_rate, -Month, -Year) 

# sub-string
female_data$agegroups <- str_sub(female_data$agegroups, end=-23)

# separate the age_group column to reflect gender and group of age
female_data <- female_data %>% 
  separate(col = agegroups, into = c("gender", "age_group"), sep = "\\ ")
###############################

# for male data
male_data <- male_data %>% 
  separate(col = Month, into = c("Month", "Year"), sep = "\\-")

# swap year and month for some rows
temp <- male_data$Year[24:length(male_data$Year)]

male_data$Year[24:length(male_data$Year)] <- 
  male_data$Month[24:length(male_data$Month)]

male_data$Month[24:length(male_data$Month)] <- temp

male_data$Year <- parse_integer(male_data$Year)

# change to complete year format
male_data$Year[male_data$Year > 17 ] = 
  male_data$Year[male_data$Year > 17] + 1900
male_data$Year[male_data$Year <= 17] = 
  male_data$Year[male_data$Year <= 17] + 2000

# gather 
male_data <- male_data %>% 
  gather(agegroups, unemployment_rate, -Month, -Year) 

# sub-string
male_data$agegroups <- str_sub(male_data$agegroups, end=-23)

# separate the age_group column to reflect gender and group of age
male_data <- male_data %>% 
  separate(col = agegroups, into = c("gender", "age_group"), sep = "\\ ")
###############################

# merge data into one tibble
data <- rbind(male_data, female_data)

###############################
# visualize the relationship between the unemployment rates and age groups 
# for both the males and females   
data %>%
  group_by(age_group, gender) %>%
  summarise(avg_rate= mean(unemployment_rate, na.rm = TRUE)) %>%
  ggplot(aes(age_group, avg_rate, fill = gender)) +
  geom_bar(position="dodge", stat = "identity") + 
  ggtitle("Unemployment Rate Average per Gender") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Unemploymet Rate Average")
