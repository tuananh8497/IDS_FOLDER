# Code for Lecture #11

# we will use the mpg dataset
library(tidyverse)
mpg
# a quick look to this dataset
glimpse(mpg)

install.packages("pander")
library(pander)

####################### UNIVARIATE ANALYSIS ###########################

# univariate analysis of a continuous variable
# summarise the continuous variable
mpg %>% 
  summarise(mean_cty= mean(cty), std_dev_cty= sd(cty))

mpg %>% 
  summarise(mean_cty= mean(cty), std_dev_cty= sd(cty)) %>%
  pander() 

mpg %>% 
  summarise(variable1= "cty", mean_cty= mean(cty), std_dev_cty= sd(cty),
            variable2= "hwy", mean_hwy= mean(hwy), std_dev_hwy= sd(hwy)) %>%
  pander() 

# percentile and quantile
mpg %>% 
  summarise(variable= "cty", 
            q0.2= quantile(cty, 0.2),
            q0.4= quantile(cty, 0.4),
            q0.6= quantile(cty, 0.6),
            q0.8= quantile(cty, 0.8))%>%
  pander() # 20% of the data is less than or equal to 13

# histogram as a visualisation tool:
mpg %>%
  ggplot(aes(cty)) +
  geom_histogram(binwidth = 1.25, color = "black",fill = "grey") +
  ggtitle("Distribution of cty")+
  xlab("cty")+
  ylab("Number of cars") +
  scale_x_continuous(breaks = seq(7.5,35,2.5)) +
  geom_vline(xintercept = mean(mpg$cty), lwd= 2, colour="red") +
  theme_minimal()

# univerariate analysis of categorical variable:
mpg %>%
  ggplot() +
  geom_bar(aes(fct_infreq(manufacturer)), color = "black",fill= "grey") +
  coord_flip() +
  labs(title = "Number of cars per manufacturer",
       x = "Manufacturer",
       y = "Number of cars") +
  scale_y_continuous(breaks = seq(0,40,5)) +
  theme_minimal()


# Numerically this can be done using the following:
mpg %>%
  group_by(manufacturer) %>%
  dplyr::summarize(frequency = n()) %>%
  arrange(desc(frequency)) %>%
  mutate(relative_frequency = frequency/sum(frequency),
         relative_cumulative_frequency = cumsum(relative_frequency)) %>%
  pander

###############################BIVARIATE ANALYSIS#######################################

# Bivariate analysis
# 1- continuous vs. categorical
mpg %>%
  ggplot(aes(cty)) +
  geom_histogram(binwidth = 1.25, color = "black",fill = "grey") +
  ggtitle("Distribution of cty")+
  xlab("cty")+
  ylab("Number of cars") +
  scale_x_continuous(breaks = seq(7.5,35,2.5)) +
  geom_vline(xintercept = mean(mpg$cty), lwd= 2, colour="red") +
  theme_minimal() +
  facet_wrap(~drv)

# equivalent to grouping based on drv
mpg %>%
  group_by(drv) %>%
  summarize(mean_cty = mean(cty), sd_cty = sd(cty)) %>%
  pander

# we can use the boxplot to show the centrality and the spread of the data
mpg %>% 
  ggplot(aes(x = drv, y = cty)) +
  geom_boxplot() +
  labs(title= "Distribution of cty relative to drv",
       x= "drv",
       y= "cty") +
  scale_y_continuous(breaks = seq(7.5, 35, 2.5)) +
  theme_minimal()


# combined with the stat_summary
mpg %>% 
  ggplot(aes(x = drv, y = cty)) +
  geom_boxplot(aes(fill=drv)) +
  stat_summary(fun.y = mean,
               geom = "point",
               shape=20,
               size=3) +
  labs(title= "Distribution of cty relative to drv",
       x= "drv",
       y= "cty") +
  scale_y_continuous(breaks = seq(7.5, 35, 2.5)) +
  theme_minimal()


# Bivariate analysis of a continuous variable with respect to another continuous variable
mpg %>%
  ggplot(aes(cty, hwy)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Relationship between hwy and cty")
  
# jitter
set.seed(5)
fig_jitter <- mpg %>%
  ggplot(aes(class, drv)) +
  geom_jitter() +
  labs(title = "Relationship between hwy and cty")

fig_jitter

set.seed(5)
fig_jitter <- fig_jitter +
  geom_point(colour="red")

fig_jitter

mpg %>%
  ggplot(aes(cty, hwy)) +
  geom_point() +
  labs(title = "Relationship between hwy and cty")+
  theme_minimal()


# plot the linear relationship
mpg %>%
  ggplot(aes(cty, hwy)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Relationship between hwy and cty")+
  geom_smooth(method="lm")


# Bivariate analysis of a categorical variable with respect to another categorical variable

# using facet on barchart
mpg %>%
  ggplot(aes(class)) +
  geom_bar() +
  facet_grid(~cyl) +
  coord_flip()

mpg %>%
  ggplot(aes(cyl)) +
  geom_bar() +
  facet_grid(~class) ## This

# colours
mpg %>% 
  ggplot(aes(class)) +
  geom_bar(aes(fill = cyl), position = "fill")

# numerically
mpg %>%
  group_by(cyl, class) %>%
  dplyr::summarize(frequency = n()) %>% 
  spread(class, frequency, fill = 0) %>%
  pander
