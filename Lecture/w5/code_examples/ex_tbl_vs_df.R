library(tidyverse)
tbl_3 <- tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace=TRUE)
)
tbl_3

# if you want to print more rows, n = ?
print(tbl_3, n = 20, width=Inf)
# also you can use the view
view(tbl_3)

# 2- subsetting
df4 <- data.frame(x = 1:3, y = 3:1)
class(df4[,1:2])
class(df4[,1])

tbl4 <- tibble(x = 1:3, y = 3:1)
class(tbl4[,1:2])
class(tbl4[,1])
class(tbl4[[1]])
class(tbl4$x)

# tibbles are also stricter with $, no partial matching
df5 <- data.frame(abc=1)
df5$a

tbl5 <- tibble(abc=1)
tbl5$a
