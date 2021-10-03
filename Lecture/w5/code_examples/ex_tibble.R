
# To use tibble, we first need to load it It It is part of the -tidyverse- package 
if (!("tidyverse" %in% rownames(installed.packages()))){
  install.packages("tidyverse") 
  }
library("tidyverse") 

# creating a tibble from existing data frame 
my_data <- iris 
my_data 
# how is it printed? 
# convert it to tibble 
my_data2 <- as_tibble(my_data) 

my_data2 # and now 

############################################33 # another way to create a tibble 
tbl_1 <- tibble( 
  x=1:5, 
  y=1, # recycling feature is allowed when it is just one element in a column 
  z=x^2+y) 

tbl_1 

# also with a transposed tibble, 'tibble' 
tbl_2 <- tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)
                 
tbl_2 
