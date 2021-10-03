# Generate 30 standard normal values, and store them as x
x <- rnorm(30)

# Obtain the entries in x which are less than 1,
print(x[x<1])

# Extract the entries between 0.5 and 1
print(x[x>=0.5 & x <= 1])

# Generate the entries whose absolute value is larger than 1.5.
print(x[abs(x) > 1.5])