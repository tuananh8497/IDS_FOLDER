# Subsetting arrays and matrices
m <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23, 38, 17), nrow= 3, ncol=4) 
m 
# extract the element of the second row and third column
m[2, 3] 
# extract all elements of the second row 
m[2,] 
# extract all elements of the third column 
m[,3] 
# extract all element of the second row except the the third element of this row 
m[2, -3] 
# extract the second and fourth elements of the second row 
m[2, c(2, 4)] 
# extract all elements of the second row except the second and fourth elements 
m[2, -c(2, 4)] 

# all of the above are either column or row, so the results were vectors 
# The results can be a sub-matrix 
a <- m[c(1,2), c(2, 4)] 
a
class(a) 
# If you want the result of subsetting to be a matrix even for row and column 
b <- m[1, ,drop= FALSE] # result in matrix 
b 
class(b) 
