# load library 
library(tidyverse)

data <- read_csv("activities.csv")

tbl <- as_tibble(data)
tbl
