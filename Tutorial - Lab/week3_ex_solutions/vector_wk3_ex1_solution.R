# initialize vector
people <- c("Jack", "Dione", "Reda", "Sally", "Adam")
weight.before <- c(78, 72, 78, 79, 105)
weight.after <- c(67, 65, 79, 70, 93)

# lost weight
weight.lost <- weight.before - weight.after
print(weight.lost)

# average weight lost
average <- mean(weight.lost)
print(average)

# who is the biggest loser?
biggest_loser.index <- which(weight.lost == max(weight.lost))
biggest_loser.name <- people[biggest_loser.index]
print(paste("Congrateulations,", biggest_loser.name, ", you are the one who have lost the most :)"))

# Is any one gaining weight?
if(any(weight.lost < 0)){
  gain_weight_person.index <- which(weight.lost < 0)
  gain_weight_person.name <- people[gain_weight_person.index]
  print(paste("Be careful,", gain_weight_person.name, ", you have gained more weight :("))
}
