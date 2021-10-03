library(tidyverse)

# we will use the airquality dataset in this example
?airquality

airquality

# we will demonstrate how to generate a histogram for the variable "Ozone"
fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram()+
  xlab("Ozone per billion") +
  ylab("Count")+
  ggtitle("Ozone Histogram")

fig

# change binwidth
fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(binwidth = 5)+
  xlab("Ozone per billion") +
  ylab("Count")+
  ggtitle("Ozone Histogram")

fig


# change x ticks to other interval
fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(binwidth = 5)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")

fig

# change the colour of bars
barfill <- "gold1"
barlines <- "goldenrod2"

fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(binwidth = 5, colour = barlines, fill= barfill)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")

fig

# you can also use the Hex colour format:
barfill <- "#4271AE"
barlines <- "#1F3552"

fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(binwidth = 5, colour = barlines, fill= barfill)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")

fig

# You can also add a gradient to your colour scheme that varies 
# according to the frequency of the values.

fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(aes(fill = ..count..), binwidth = 5)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")

fig

# You can customise the gradient by changing the anchoring colours 
# for high and low.
fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(aes(fill = ..count..), binwidth = 5)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")+
  scale_fill_gradient("Count", low = "blue", high = "red")

fig

# changing theme
fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(aes(fill = ..count..), binwidth = 5)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")+
  scale_fill_gradient("Count", low = "blue", high = "red")+
  theme_bw()

fig
# you can look at the ggthemes for more of themes

# adding a dashed line to the histogram
fig <- ggplot(data= airquality, aes(x = Ozone))+
  geom_histogram(aes(fill = ..count..), binwidth = 5)+
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Ozone Histogram")+
  scale_fill_gradient("Count", low = "blue", high = "red")+
  theme_bw()+
  geom_vline(xintercept = 75, size = 1, colour = "green",
             linetype = "dashed")

fig
