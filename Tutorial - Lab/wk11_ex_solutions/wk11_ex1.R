gender <- sample( c("Male", "Female", "Not-mentioned"), 100, replace=TRUE)

subject <- sample( c("Math", "Science", "Other"), 100, replace=TRUE)

data <- tibble(gender, subject)

# extract the feqs of gender
gender_feq <- table(data$gender)

gender_subject_feq <- table(data$gender, data$subject)

# proportions

proportions <- prop.table(gender_subject_feq)

# p(Math) = 
margin.table(proportions, 2)["Math"]

# p(Male) = 
margin.table(proportions, 1)["Male"]

 # for the conditional probabilities,
# p(x | y) = p(x , y) / p(y), where p(y) can be extracted using marginal.table
# p(Female | Math) = 

proportions["Female", "Math"] / margin.table(proportions, 2)["Math"]

# p(Science | Female) = 
proportions["Female", "Science"] / margin.table(proportions, 1)["Female"]

# Visualisation
ggplot(data, aes(x = gender, fill = subject)) +
  geom_bar(position = "dodge")

ggplot(data, aes(x = gender, fill = subject)) +
  geom_bar(position = "fill")

