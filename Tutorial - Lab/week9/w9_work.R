library(tidyverse)

data_male <- read_csv("1978-2017-australiansdg-indicator-8-5-2a-males.csv")

data_female <- read_csv("1978-2017-australiansdg-indicator-8-5-2a-females.csv")

tbl_male <- as_tibble(data_male)

tbl_female <- as_tibble(data_female)

