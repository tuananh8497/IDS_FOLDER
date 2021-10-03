# Loop statement
page.limit <- 10
for(count in 1:page.limit){
  print(paste("page number is:", count))
}

print("Flipping the pages has finished")

count <- 0
while(count < page.limit ){
  count <- count + 1
  print(paste("page number is: ", count))
}

ac <- c(4, 6.1, NA, 2)
mode(ac)
