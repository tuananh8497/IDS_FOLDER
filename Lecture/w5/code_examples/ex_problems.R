# base function to read data.frame
df <- read.csv("challenge.csv")
df
view(df)
df[1001,]
str(df)
problems(df) # no problems as everything are chars
##################################
# readr functions to read csv
tbl <- read_csv("challenge.csv")
tbl
view(tbl)
tbl[1001,]
str(tbl)
##################################
# use problems to check the problems in the tbl parsing
problems(tbl)

# how to fix the problems
# first let us fix the problem by hard-specifying the column types
tbl2 <- read_csv(
  readr_example("challenge.csv"), 
  col_types = cols(
    x = col_double(),
    y = col_character()
  )
)
tbl2
tail(tbl2) # there are dates stored with this column
# change the character to date
tbl3 <- read_csv("challenge.csv", 
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)
tbl3
tail(tbl3)
str(tbl3)
