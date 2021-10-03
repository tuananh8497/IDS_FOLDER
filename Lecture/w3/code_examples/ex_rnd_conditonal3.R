CheckMarkSummary <- function(students.marks){
  students.average <- mean(students.marks)
  print(paste("average mark of the class is:", students.average))
  # multiple if else
  students.marks <- students.marks + 10
  if(students.average < 50){
    print(paste("The performance is bad, as the average =", students.average))
  }else if(students.average < 60){
    print(paste("The performance is good, as the average =", students.average))
  }else{
    print(paste("The performance is Excellent, as the average =", students.average))
  }
  print("Test is completed!")
}
# Generate random numbers
students.length <- 50
students.marks <- runif(students.length, min=0, max=100)
students.marks = students.marks + 10
CheckMarkSummary(students.marks)

