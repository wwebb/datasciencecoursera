# Question 1

# cube(3) returns the number 27
cube <- function(x, n) {
 x^3
}
 
cube(3)


# Question 2

# The code returns a warning because 'x' is a vector of length 10 and
# 'if' can only test a single logical statement.
x <- 1:10

if(x > 5) {
  x <- 0
}


# Question 3

# The number 10 is returned
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)


# Question 4

# What is 'y' fater evaluating this expression? It is y = 10

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}


# Question 5

# Which symbol is a free variable? Answer: f

h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}


# Question 6
# What is an environment in R?
# Answer: a collection of symbol/value pairs


# Question 7
# The R language uses what type of scoping rule for resolving free variables?
# Answer: lexical


# Question 8
# How are free variables in R functions resolved?
# Answer: The values of free variables are searched for in the environment in which the function was defined


# Question 9
# What is one of the consequences of the scoping rules used in R?
# Answer: All objects must be stored in memory.


# Question 10
# In R, what is the parent frame?
# Answer: It is the environment in which a function was called.