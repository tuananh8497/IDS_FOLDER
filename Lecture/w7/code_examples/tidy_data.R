library(tidyverse)

# we will use the built-in USArrest dataset, 

# for more information about the dataset, we can use ? operator
?USArrests

all_data <- USArrests
all_data

# select subset (6 rows) of the data
data_df <- all_data[c(1, 10, 20, 30, 40, 50),]
data_df

# convert it to tibble
data_tbl <- as_tibble(data_df)
data_tbl

# add the rownames as a separte column and give it a name, i.e. state
state <- rownames(data_df)
state
data_tbl <- data_tbl %>% 
  mutate(state=state)

data_tbl

#-------------------------------------------
# Using gather function to turn wide table to long
data_tbl_1 <- gather(data_tbl, 
                        key= "arrest_attribute",
                        value= "arrest_estimate",
                        c(Murder,Rape,Assault,UrbanPop))

data_tbl_1

#-------------------------------------------
# Using Spread function to turn log table to wide
data_tbl_2 <- spread(data_tbl_1, 
                   key = "arrest_attribute",
                   value = "arrest_estimate"
)
data_tbl_2

#-------------------------------------------
# Using unite function to join coulmns into one character column
data_tbl_3 <- unite(data_tbl,
                  col = "Murder_Assault",
                  Murder, Assault,
                  sep = "_")
data_tbl_3

#-------------------------------------------
# Using separate function to split a coulmn into multiple columns
data_tbl_4 <- separate(data_tbl_3,
                    col = "Murder_Assault",
                    into= c("Murder", "Assault"),
                    sep = "_")
data_tbl_4
