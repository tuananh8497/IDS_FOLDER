# week 10, ex 4

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(~ class)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(year ~ cyl)
