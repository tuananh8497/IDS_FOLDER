GenerateMarkSummary <- function(students.marks, summary.type){
  result <- switch(summary.type,
         "mean"={
           mean(students.marks)
         },
         "median"={
           median(students.marks)
         },
         "var"={
           var(students.marks)
         },
         "Not implemented"
         )
  print(result)
}
# Generate random numbers
students.length <- 50
students.marks <- runif(students.length, min=0, max=100)
GenerateMarkSummary(students.marks, "mean")
GenerateMarkSummary(students.marks, "median")
GenerateMarkSummary(students.marks, "var")
GenerateMarkSummary(students.marks, "minimum")
