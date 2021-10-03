# for loops to check the validity of the emails
emails <- c('myname@mycompany.com',
            'my@mycompany.com',
            'name@mycompany.net',
            'work@mycompany.org',
            'mywork#mycompany.net',
            'myproduct#mycompany.com',
            'myCoffee2mycompany.org',
            'mycar@mycompany.com',
            'mypet@mycompany.com',
            'hobbies!mycompany.com')

# loop over the vector elements and check the validity of each email
notValid = vector()
for(em in emails){
  print(em)
  # check if '@' character exist in a string
  valid <- grepl('@', em)
  if(!valid){
    # concatenate the not-valid emails to each other, one-by-one
    notValid <- c(notValid, em)
  }
}
print(notValid)