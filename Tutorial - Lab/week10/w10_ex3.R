# Week 10, Ex3

ggplot(mpg, aes(x=class)) +
  geom_bar()

# position = "dodge": value next to each other
ggplot(mpg, aes(x=class,fill=drv))+
  geom_bar(position="fill") +
  scale_y_continuous(labels= scales::)

