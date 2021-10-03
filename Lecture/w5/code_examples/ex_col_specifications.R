# col specifications
# logicals
lgl <- parse_logical(c("TRUE", "FALSE", "NA"))
str(lgl)
# integers
intgr <- parse_integer(c("1", "2", "3"))
str(intgr)
# date
dt <- parse_date(c("2010-01-01", "1979-10-14"))
str(dt)
# which strings should be specified as missing
intgr_missing <- parse_integer(c("1", "231", ".", "456"), na = ".")
str(intgr_missing)
# sometimes the parsing fails, NAs will be used when failure is occuring
x <- parse_integer(c("123", "345", "abc", "123.45", "221"))
x
# here you can use problems
problems(x)

# parse numbers with . or , or $ or %
dbl <- parse_double("1.24")
str(dbl)
num <- parse_number("$123,456,789")
num
num <- parse_number("$123,456,789")
num
num <- parse_number("$123.456.789", locale=locale(grouping_mark = '.'))
num
num <- parse_number("123'456'789", locale = locale(grouping_mark = "'"))
num
