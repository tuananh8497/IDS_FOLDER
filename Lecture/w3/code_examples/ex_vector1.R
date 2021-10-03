# Create atomic vectors

# Character 
houses.addresses <-  c("7 George st", 
                      "18/5 Irwan cresent", 
                      "8 Morad close", 
                      "1/2 London Circuit")
houses.addresses
length(houses.addresses)
is.character(houses.addresses)
str(houses.addresses)

# Numeric
houses.area <- c(420.5, 220.15, 750.4, 120.5)
houses.area
length(houses.area)
str(houses.area)

# Integer
houses.bedrooms <- c(4L, 3L, 5L, 2L)
houses.bedrooms
length(houses.bedrooms)
str(houses.bedrooms)

# Logical
houses.has.garden <- c(TRUE, FALSE, TRUE, FALSE)
houses.has.garden
length(houses.has.garden)
str(houses.has.garden)
