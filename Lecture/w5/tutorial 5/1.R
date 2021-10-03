books_df <- data.frame(author=c("Reda", "John", "Edward", "Ben"), year=c(2104, 2016, 2005, 2019), publisher=c("Wiley", "Springer", "Sage", "International Books"))# convert the data frame as a tibble
books_tbl <- as_tibble(books_df)
books_tbl

Anything_df <- data.frame(
  A = 1:1000,
  B = A * 2 + rnorm(length(A))
)
