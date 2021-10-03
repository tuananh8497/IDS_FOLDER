# week 10, ex 3

df <- data.frame(
  gender=factor(rep(c("F", "M"), each=200)),
  weight=round(c(rnorm(200, mean=55, sd=5), rnorm(200,
                                                  mean=65, sd=5))))
df <- as_tibble(df)
# 1

p <- ggplot(df, aes(x=weight)) + 
  geom_histogram(stat = "count")


p 


# 2
pp <- ggplot(df, aes(weight, color = gender)) + 
  geom_histogram(stat = "count", position = "dodge")


pp

# 3

means <- df %>% 
  group_by(gender) %>% 
  summarise(average =mean(weight, na.rm = TRUE))

average_female <- means$average[means$gender == "F"]
average_male <- means$average[means$gender == "M"]

pp + geom_vline(aes(xintercept = average_female),
                linetype="dashed", color = "blue") +
  geom_vline(aes(xintercept = average_male),
                 linetype="dashed", color = "orange")

# 4
ggplot(df, aes(x = gender, y = weight)) + 
  geom_boxplot()


# combined with stat_summary
ggplot(df, aes(x = gender, y = weight)) + 
  geom_boxplot(aes(fill=gender))+
  stat_summary(fun.y = mean,
               geom = "point",
               shape=20,
               size=3)
