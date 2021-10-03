# arrays 
my.array <- array(1:24, dim=c(3,4,2)) 
my.array 
# Q: how are the items ordered? 
# A: It is ordered column-wise 
# change the dimensions of a vector in R 
my.vector <- 1:24 
dim(my.vector) <- c(3,4,2) 
# check that the contents of two objects are equal using identical function 
identical(my.array, my.vector) 
# matrices 
my.matrix <- matrix(1:24, 4) 
my.matrix 
