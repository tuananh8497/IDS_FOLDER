
# rbind and cbind example
m1 <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23, 38, 17), nrow=3, ncol=4) 
             
m1 
             
res <- cbind(c(4, 76, 12), ml[, 4]) 
             
res 

res <- rbind(c(4, 76, 12, 14), m1[3, ]) 

res 


m2 <- matrix(rep(10, 16), nrow= 4, ncol= 4)
m2 

m3 <- rbind(m1[11 ], m2[3, ]) 

m3 

