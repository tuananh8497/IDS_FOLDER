# create dataframe from vectors 

employee <- c('John Doe','Peter Gynn','Jolie Hope') 
salary <- c(21000, 23400, 26800) 
startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14')) 

employ.data <- data.frame(employee, salary, startdate) 

# check structure of data frame 
str(employ.data) 

# keep characters as characters 
employ.data <- data.frame(employee, salary, startdate, stringsAsFactors = FALSE) 
str(employ.data) 

# using the accessor $ to access the variables of the data frame 
employ.data$employee 
class(employ.data$salary) 
employ.data$startdate[1] 

# what is the difference between the following expressions 
aa <- employ.data["salary"] 
bb <- employ.data[["salary"]] 

aa 
class(aa) 

bb 
class(bb) 
