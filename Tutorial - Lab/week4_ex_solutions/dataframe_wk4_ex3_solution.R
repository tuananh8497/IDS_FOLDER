# week 4, exercise 3
# practice on the data frame

# create colour vector
boxes.colour <- c("purple", "red", "yellow", "brown")

# create weight vector
boxes.weight <- c(40, 30, 18, 23)

# create the data frame
boxes.info <- data.frame(colour=boxes.colour, weight=boxes.weight, stringsAsFactors = FALSE)

# 1- display the data frame
boxes.info
# 2- Display the content of the third row, similar to matrix
boxes.info[3,]

# 3- Display the content of the first column, similar to matrix
boxes.info[,1]

boxes.info[,"colour"]

subset(boxes.info, select = c("colour"))

# 4 select the [4, 1] elment
boxes.info[4,1]
