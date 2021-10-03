# week 9, ex1

library(tidyverse)

# 1
ggplot(data = mpg)

# 2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy)) 


# 3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy, colour = class)) 

# 4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv)) 


