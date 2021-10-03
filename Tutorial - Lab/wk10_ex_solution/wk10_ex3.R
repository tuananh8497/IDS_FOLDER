# week 10, Ex3

ggplot(mpg, aes(x = class)) + 
  geom_bar()


# position = "dodge": values next to each other
ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar(position = "dodge")

# position = "fill": percentage chart
ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar(position = "fill")
