# week 11, ex 4
# understanding boxplot

# read data:
data <- read_csv("data/surveys_complete.csv")
data

# Visualize the distribution of species' weights grouping by their id:
ggplot(data = data, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot()

# visualize the points of the weights on top of the boxplot (in a jitter manner)
ggplot(data = data, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")

# increse the transparency of the points
ggplot(data = data, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.05, color = "tomato")
