# Factor example

# Create character vector for types of the properties 
houses.types.chr <- c("House", "Unit", "House", "Unit")
houses.types
str(houses.types)
# Create integral vector for types of the properties 
houses.types <- c(1L, 2L, 1L, 2L)
houses.types
str(houses.types)

# create a factor 
houses.types <- factor(houses.types.chr)
houses.types
# underlying representation of factor
unclass(houses.types)
str(houses.types)
# Searching using characters
houses.types[houses.types == "House"] # not effecient
# Searching using integer
houses.types[as.numeric(houses.types) == 1] # effecient

#
employees.gender <- rep(c("female", "male", "male", "female", "male"), 10)
employees.gender
employees <- factor(employees.gender)
str(employees)

# order of levels
x <- factor(c("yes", "no", "yes", "no"))
x
y <- factor(c("yes", "no", "yes", "no"), levels= c("yes", "no"))
y

