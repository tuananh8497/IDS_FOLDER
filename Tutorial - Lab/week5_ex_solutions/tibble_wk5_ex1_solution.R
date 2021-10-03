# Wk5, Ex 1
install.packages("tidyverse")
library(tidyverse)

anything_df <- data.frame(
  A  = 1:1000,
  B = A * 2 + rnorm(length("A"))
) # error in creating the data frame that way, 
  #as it is not possible to create a dataframe and use its variables names on fly. 

anything_tbl <- tibble(
  A = 1:1000,
  B = A * 2 + rnorm(length(A))
)

# 1- print the contents of both
print(anything_df) # error
print(anything_tbl)

# 2.	Extracting the variables called A and B.
anything_tbl$A
anything_tbl$B

# 2.	Plotting a scatterplot of A vs B, using ggplot2::qplot(x,y) function
# ggplot2::qplot(anything$A, anything$B)

# 3.	Creating a new column called C which is B divided by A
new_tbl <- add_column(anything_tbl, C=anything_tbl$B/anything_tbl$A)
new_tbl



# 4.	Renaming the columns to First, Second and Third
colnames(new_tbl) <- c("First", "Second", "Third")
new_tbl

# First try to create a  new cols.
new_tbl_1 <- add_column(new_tbl, d=new_tbl$First+new_tbl$Second+new_tbl$Third)
colnames(new_tbl_1) <- c("a","b","c","d")
new_tbl_1

test_tibble <- tibble(
  A = 5:15,
  B = 15:5,
  C = A^2 + 2*A*B + B^2
)

test_tibble

test_tibble$D <- test_tibble$C / (test_tibble$A - test_tibble$B)^2

view(test_tibble)  

ggplot2::qplot(test_tibble$A,test_tibble$B,test_tibble$C)

