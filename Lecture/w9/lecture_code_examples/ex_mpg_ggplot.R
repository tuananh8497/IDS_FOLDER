library(tidyverse)

mpg

?mpg

# create a basic scatter plot to check the relationship between the 
# engine size and the fuel efficiency (mpg)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# change colour
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour= class))

# change shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape= class))

# change size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size= class))

# change transperancy (e.g. alpha)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha= class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color= "blue")

# using facets to add additional variables

# with one variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~class, nrow = 2)

# with two variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(drv ~ cyl)
