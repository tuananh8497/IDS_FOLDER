# wk 10, Ex2

data <- c(199, 201, 236, 269,271,278,283,291, 301, 303,341)

quartiles <- quantile(data)

lower_q <- quartiles[2]

upper_q <- quartiles[4]

IQR <- upper_q - lower_q

lowest <- lower_q - 1.5 * IQR 

highest <- upper_q + 1.5 * IQR

data[data < lowest |  data > highest]

# visualising the box plot


data_frame <- tibble(data)
ggplot(data_frame, aes(x = as.factor("values"), y = data)) + 
  geom_boxplot()
  

