library(tidyverse)

# load data
data <- read_csv("data/smoker.csv")

data

# barplot for the smoke variable

ggplot(data, aes(x = Smoke)) +
  geom_bar()+
  xlab("type of smokes") +
  ylab("count") +
  ggtitle("Smokers data") 

# change theme
ggplot(data, aes(x = Smoke)) +
  geom_bar()+
  xlab("type of smokes") +
  ylab("count") +
  ggtitle("Smokers data")+
  theme_light()


# use type of smokers as the fill of the bars 
ggplot(data, aes(x = Smoke, fill= Smoke)) +
  geom_bar()+
  xlab("type of smokes") +
  ylab("count") +
  ggtitle("Smokers data")+
  theme_light()


