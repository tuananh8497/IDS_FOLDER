x <- 6:15
y <- 21:30
# arithematic op on vectors
x+y
x * y
x / y
# logical op on vectors
x > 8
x >= 8
y == 28
# subsetting
x[1]
x[2]
y[2:5]
x[c(T,F,F,T,F,T,T,F, F,T)]
x[x >= 7]
# coercions: converting one type to another
# implicit coercions
z <- c(8, 7.4, 14, "5")
str(z)
# explicit coercions 
# sensible coercions
as.numeric(x >= 9) # converting logical values to numeric values
as.character(x)

houses.area <- c(420.5, 220.15, 750.4, 120.5)
houses.area
as.integer(houses.area)

# non sensible coercions
houses.addresses <- c("7 George st", "18/5 Irwan cresent", "8 Morad close", "1/2 London Circuit")
houses.addresses
as.numeric(houses.addresses) # warning here and NAs are the result 
