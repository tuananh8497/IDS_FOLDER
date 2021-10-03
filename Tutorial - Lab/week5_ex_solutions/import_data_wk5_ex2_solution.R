# wk5, Ex2
library(tidyverse)
read_csv("a,b\n1,2,3\n4,5,6")
read_csv("a,b,c\n1,2\n1,2,3,4")
read_csv("a,b\n\"1") # The open quote \" is dropped because there is no paired close quote. There is only one value in the second row, so NA is coerced in the second column.
read_csv("a,b\n1,2\na,b")
read_csv("a;b\n1;3")
