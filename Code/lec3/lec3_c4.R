# Students names
student.names <- c("A","B","C","D","E")

# Chemistry marks
student.marks.chemistry <- c(65, 59, 80, 91, 70)

# biology marks
student.marks.biology <- c(73, 55, 61, 48, 80)

students.marks.combined <- student.marks.chemistry + student.marks.biology
students.marks.combined

student_id <- which.max(students.marks.combined)

student_id

print(student.names[student_id])

nums <- rnorm(50, mean = 2, sd = 3)

positive_nums <- nums[nums>=0]
positive_nums

negative_nums <- nums[nums<0]
negative_nums
