library(tidyverse)
# 1- Read airquality dataset as tibble
air_tbl <- as_tibble(airquality) 
view(air_tbl)

# 2- Find the observations with NA values in Ozone
indx <- is.na(air_tbl)
air_tbl[indx, ]
class(indx)

# check the rows that have at least one NA value (i.e. one TRUE)

na_indecies <- apply(indx, 1, any)

# extract the sub-tibble that has NAs
na_tbl <- air_tbl[na_indecies, ]
na_tbl
view(na_tbl)

# 3-	Add a new column that includes the date of each observation
new_tbl <- add_column(air_tbl, Date=sprintf("1973-%02d-%02d",air_tbl$Month, air_tbl$Day))
new_tbl

# change the added column to date
new_tbl$Date <- parse_date(new_tbl$Date)

