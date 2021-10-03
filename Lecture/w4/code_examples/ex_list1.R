# vectors
# Character
houses.addresses <- c("7 George st", "18/5 Irwan cresent", "8 Morad close", "1/2 London Circuit")
# Numeric
houses.area <- c(420.5, 220.15, 750.4, 120.5)
# Integer
houses.bedrooms <- c(4L, 3L, 5L, 2L)
# Logical
houses.has.garden <- c(TRUE, FALSE, TRUE, FALSE)

# Combine the features of each proprty
# using vector
houses.sample <- c(address= houses.addresses[1], area=houses.area[1], bedrooms= houses.bedrooms[1], 
                   has_garden=houses.has.garden[1])
print(houses.sample)
mode(houses.sample)
houses.sample[1]
houses.sample[2]
houses.sample['bedrooms']
str(houses.sample)
# using list
houses.sample <- list(address= houses.addresses[1], area=houses.area[1], bedrooms= houses.bedrooms[1],
                      has_garden=houses.has.garden[1])
print(houses.sample)
mode(houses.sample)
houses.sample[1]
houses.sample[2]
houses.sample['bedrooms']
houses.sample$bedrooms
mode(houses.sample$bedrooms)
str(houses.sample)
