# Example for R Arithmetic Operators
a <- 10
b <- 5
add <- a + b
print(paste("Addition is:", add))

sub <- a - b
print(paste("Subtracting is:", sub))

multi <- a * b
print(paste("Multiplication is:", multi))

division <- a / b
print(paste("Division is", division))

Integer_Division <- a %/% b
print(paste("Integer Division is:", Integer_Division))

exponent = a ^ b
print(paste("Exponent is:", exponent))
format(exponent, scientific=FALSE)
modulus = a %% b

print(paste("Modulus is:", modulus))
