# read csv file using the core functions in R
df <- read.csv("data_sample.csv", header = T)
df

# reading using readr's functions
tbl <- read_csv("data_sample.csv")
