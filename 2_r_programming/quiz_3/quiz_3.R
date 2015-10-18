# Question 1
# In the iris dataset, what is the mean of 'Sepal.Length' for the species virginica?

# Answer:  6.588

library(datasets)
data(iris)
tapply(iris$Sepal.Length, iris$Species, mean)


# Question 2
# Continuing with the 'iris' dataset from the previous Question, what R code 
# returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 
# 'Petal.Length', and 'Petal.Width'?

# Answer:  apply(iris[, 1:4], 2, mean)

apply(iris[, 1:4], 2, mean)


# Question 3
# In the mtcars dataset, How can one calculate the average miles per gallon 
# (mpg) by number of cylinders in the car (cyl)?

# Answer:  with(mtcars, tapply(mpg, cyl, mean))

library(datasets)
data(mtcars)

split(mtcars$mpg, mtcars$cyl)
# one possibility:
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# another possibility:
with(mtcars, tapply(mpg, cyl, mean))


# Question 4
# Continuing with the 'mtcars' dataset from the previous Question, what is the 
# absolute difference between the average horsepower of 4-cylinder cars and the 
# average horsepower of 8-cylinder cars?

# Answer:  126.5779

meanHPbyCyl <- sapply(split(mtcars$hp, mtcars$cyl), mean)
diff <- meanHPbyCyl[3] - meanHPbyCyl[1]
diff

meanHPbyCyl2 <- with(mtcars, tapply(hp, cyl, mean))
diff <- meanHPbyCyl2[3] - meanHPbyCyl2[1]
diff

# Question 5
# If you run debug(ls) what happens when you next call the 'ls' function?

# Answer:  Execution of 'ls' will suspend at the beginning of the function 
# and you will be in the browser.

debug(ls)
ls