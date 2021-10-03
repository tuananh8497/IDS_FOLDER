# Generate random marks for the students
students.length <- 50
students.mark <- rnorm(students.length, mean = 50, sd = 50)

# Compute average
student.average <- mean(students.mark)
print(paste("average mark of the class is:", student.average))

# Check average mark for the class
if(student.average >= 50){
  print(paste("The performance is OK, as the average =", student.average))
}

print("Test is completed")

x <- c(0,1,2,-4,5)
if(x>0){print(x)} 

# ifelse(Boolean_expression, statementA, statementB)
result = ifelse(x > 0, 1/2, NA)
result
