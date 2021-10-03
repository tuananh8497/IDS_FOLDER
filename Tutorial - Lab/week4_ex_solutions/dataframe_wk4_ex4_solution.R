# week 4, exercise 3
# practice on the data frame

# create a database for the films
new_films <- data.frame(title=c("film1", "film2", "film3"),
                    director=c("A", "B", "C"),
                    year=c(2012, 2000, 2104),
                    country=c("Australia", "Egypt", "India"), stringsAsFactors = FALSE)

old_film <- data.frame(title=c("film4"), 
                       director=c("D"),
                       year=c(1989),
                       country=c("China"), stringsAsFactors = FALSE)

# merge the two data frames
films <- rbind(new_films, old_film)
films

# titles
films$title

# sorting based on the year ascendingly
films[sort(films$year), ] # what is the output?
# let us use order instead
films[order(films$year),]

# sorting based on the year descendingly
films[order(-films$year),]

# using edit
films <- edit(data.frame())
# continue ...