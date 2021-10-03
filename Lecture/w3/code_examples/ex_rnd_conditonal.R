# p Generate random marks for the students 
students.length <- 50 
students.marks <- rnorm(students.length, mean= 50, sd=50) 

# compute average 
students.average <- mean(students.marks) 
print(paste("average mark of the class is:", students.average)) 

# A check average mark of the class 
if(students.average >= 50){ 
  print(paste("The performance is OK, as the average =", students.average)) 
} 
print("Test is completed!") 
