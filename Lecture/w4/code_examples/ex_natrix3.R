
# using rownames() and colnames() functions
results <- matrix(c(10, 30, 40, 50, 43, 56, 21, 30), 2, 4, byrow= TRUE) 

# names of the columns

colnames(results) <- c("1st_qrt", "2nd_qrt", "3rd_qrt", "4th_qrt") 

# names of the rows 
rownames(results) <- c("store1", "store2") 

# show the matrix 
results 

# indexing using the names of the columns/rows 

results["store1", ] 
results["store2", c("1st_qrt", "4th_qrt")]
