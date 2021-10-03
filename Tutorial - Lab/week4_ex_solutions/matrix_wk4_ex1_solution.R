# week 4, exercise 1
# practice on the matrices
v1 <- c(3, 9, -1, 4, 2, 6)
v2 <- c(5, 2, 0, 9, 3, 4)

# create m1
m1 <- matrix(v1, nrow=2)
m1
# create m2
m2 <- matrix(v2, nrow=2)
m2
# m1 + m2
m1+m2
# m1 - m2
m1 - m2
# m1 * m2
m1 * m2
# m2^T
m3 <- t(m2)
m3
# matrix multiplication
m4 <- m1 %*% m3
m4
# dimention of m4
dim(m4)
# subsetting by row or by column
m1[1,]
m1[,1]
