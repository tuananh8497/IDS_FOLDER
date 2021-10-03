# week 10, Exercise 2

# Left column: x and y mapping needed!
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()+
  geom_smooth()

# Right column: no y mapping needed!
ggplot(data = mpg, aes(x = class)) +
  geom_bar()  

# Change the ticks of the x-axis
ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram() +
  scale_x_continuous(name = "ozone per billion",
                     breaks = seq(min(mpg$hwy), max(mpg$hwy), 5),
                     limits=c(min(mpg$hwy), max(mpg$hwy)))
  

# vertical line 
median_value = median(mpg$hwy)

ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram() +
  theme_bw()+
  geom_vline(xintercept = median_value, size = 1, colour = "green",
             linetype = "dashed")


