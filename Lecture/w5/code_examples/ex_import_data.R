# Import data into R

# It is part of the `tidyverse` package
if (!("tidyverse" %in% rownames(installed.packages()))){
  install.packages("tidyverse")
}

library("tidyverse")

heights <- read_csv("heights.csv")

# supply inline csv file
read_csv("a,b,c
1,2,3
4,5,6")

# skip first two lines, i.e. meta data the beginning of a file
read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3", skip = 2)
# or skip when comment
read_csv("# A comment I want to skip
  x,y,z
  1,2,3", comment = "#")

# by default the first row is for column, we can skip this rule
read_csv("1,2,3\n4,5,6", col_names = FALSE) # \n is convenient shortcut for new line
# pass column names
read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))

# deal with na values
abc <- read_csv("a,b,c\n1,2,.", na = ".")
abc
write.csv(abc, "datatest.csv", na = "-")

