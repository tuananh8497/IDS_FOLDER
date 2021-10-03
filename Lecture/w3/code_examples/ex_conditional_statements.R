set.seed(8)
x <- rpois(1, lambda=8)
print(x)
if (x >= 5) {
  print("x is greater than or equals 5")
} else {
  print("x is smaller than 5")
}

