PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/test.csv"
df_titanic <- read.csv(PATH, sep = ",")
# Return the column names containing missing observations
list_na <- colnames(df_titanic)[ apply(df_titanic, 2, anyNA) ]
list_na

colnames(df_titanic)[apply(df_titanic, 2, anyNA)]

library(dplyr)
# Exclude the missing observations
df_titanic_drop <-df_titanic %>%
  na.omit()		
dim(df_titanic_drop)

# Create mean
average_missing <- apply(df_titanic[,colnames(df_titanic) %in% list_na],
                         2,
                         mean,
                         na.rm =  TRUE)
average_missing

# Create a new variable with the mean and median
df_titanic_replace <- df_titanic %>%
  mutate(replace_mean_age  = ifelse(is.na(age), average_missing[1], average_missing$Age),
         replace_mean_fare = ifelse(is.na(fare), average_missing[2], fare))

sum(is.na(df_titanic_replace$age))


# Quick code to replace missing values with the mean
df_titanic_impute_mean <- data.frame(
  sapply(
    df_titanic,
    function(x) ifelse(is.na(x),
                       mean(x, na.rm = TRUE),
                       x)))
