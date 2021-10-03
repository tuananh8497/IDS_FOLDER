print(LETTERS)

# print first 12 letters
print(LETTERS[1:12])

# print odd numbered letters
print(LETTERS[seq(from=1, to=26, by=2)])

# print English vowels
# here we can use regular expression function 'grep' to do that
# to check the help of this function, we can do that via ?grep in the console window
index_vowels <- grep('["AEIOUY"]', LETTERS)
print(LETTERS[index_vowels])

# print English consonants
# here we can either use the negative indices of the extracted vowels or 
# again use the regular expressions
print(LETTERS[-index_vowels])

# or
index_cons <- grep('[^"AEIOUY"]', LETTERS)
print(LETTERS[index_cons])
