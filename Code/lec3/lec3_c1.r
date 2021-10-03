my.vec<- c("elem1","elem2","elem3","elem4")
length(my.vec)
mode(my.vec)
class(my.vec)
x <- my.vec[2]
x <- my.vec[2:4]

print(x)

u <- c(4, 7, 23.5, 76.2, 80, "rrt")
v <- c(4, 6, NA, 2)
k <- c(TRUE,FALSE, FALSE, NA, TRUE)

a <- c(45 ,243, 78, 343, 445, 44, 56, 77)

mode(a)
length(a)
a[3]
a[2:5]
a[9]
range(a)

fruits <- c("Apple", "oranges", "banana")
vegies <- c("cabagge", "spinach", "tomatoes")

all_basket_items <- c(fruits, vegies)
print(all_basket_items)

v1 <- c(4, 6, 8, 12)
2 * v1

v2 <- c(4, 7, 23.5, 76.2, 80)
sqrt(v2)  # Can bac 2

v1 + v2

x <- 1:100
x

y <- -12:0
y

seq(1, 4, 0.5)

seq(from= -4, to = 0, length=4)

seq(length=10, from= -2, by=0.2)

rnorm(10)

rnorm(10, mean = 4, sd = 3)

rt(5, df=10)

vec <- rep(1:2, 5)
vec

vec <- rep(1:2, each=3)
vec

vec <- rep(c("m","f"), 3)
vec
