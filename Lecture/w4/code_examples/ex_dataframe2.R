# create and manipulate data frame 
my.dataset <- data.frame(site=c("A", "B", "A", "A", "B"), 
                         season=c("Winter", "Summer", "Summer", "Spring", "Fall"), 
                         pH=c(7.4,6.3,8.6,7.2,8.9), stringsAsFactors = FALSE) 

my.dataset 
my.dataset[3, 2] 
my.dataset$pH 

# subsetting with conditions 
my.dataset[my.dataset$pH > 7, ] 
my.dataset[my.dataset$pH > 7, "site"] 
my.dataset[my.dataset$season == "Summer", c("site", "pH")] 

# Is it possible to refer to the columns directly? 
my.dataset[pH > 7, ] 
# This is only possible if you 'attach' the dataset 
attach(my.dataset) 
my.dataset[pH > 7, ] 
season 
my.dataset[site=='B', ] 

# To go back, use 'detach' 
detach(my.dataset) 
season 

# it is much safer to use 'subset' 
subset(my.dataset, pH > 8) 
subset(my.dataset, season=="Summer", select=c(season,pH)) 
# change values in the dataframe, e.g., sum 1 to the pH values of all summer rows 
my.dataset[my.dataset$season == "Summer", 'pH'] <- my.dataset[my.dataset$season == "Summer", 'pH'] + 1 
subset(my.dataset, season=="Summer", select=c(season,pH)) 
