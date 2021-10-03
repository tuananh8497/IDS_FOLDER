library(ggplot2)
head(economics)

?economics

ggplot(economics, aes(x = date, y = unemploy)) + geom_line()
