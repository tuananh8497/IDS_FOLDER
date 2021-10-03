a <- matrix(c(1,2,3,4,5,6,7,8,9,10), 2,5)
a

b <- array(c(1,2,3,4,5,6,7,8), c(2,2,2))
b

my_array <- array(c(1:24), dim = c(3,4,2))
my_array

my.vector <- 1:24
dim(my.vector) <- c(3,4,2)

identical(my_array, my.vector)

my.matrix <- matrix(1:24, nrow = 4, ncol = 6)
my.matrix

result <- matrix(1:8, 2, 4, byrow = TRUE)
result

colnames(result) <- c("first", "second", "third","fourth")
rownames(result) <- c("store1", "store2")
result
result["store1", ]
result["store2", c("first", "fourth")]
