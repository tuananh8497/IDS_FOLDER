# week 10, exercise 2

# Left column: x and y mapping needed!
ggplot(data=mpg, mapping=aes(x = displ, y = hwy)) +
  geom_point(colour = "red") +
  geom_jitter(colour = "green")

ggplot(data=mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_jitter(mapping = aes (x = displ, y = hwy), colour = "green")

# Right column: no y mapping needed!
ggplot(data = mpg, aes(x = class)) +
  geom_bar()

# Change the tick of the x-axis
ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 2) +
  scale_x_continuous(name = "",
                     breaks = seq(min(mpg$hwy), max(mpg$hwy), 3),
                     limits = c(min(mpg$hwy), max(mpg$hwy)))

# vertical line
median_value = median(mpg$hwy)

ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram() +
  theme_bw()+
  geom_vline(xintercept = median(mpg$hwy), size = 1, colour = "green",
             linetype = "dashed")