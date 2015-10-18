# Question 1
# The R language is a dialect of which of the following programming languages?

# Answer: S
# Comment: R is a dialect of the S language which was developed at Bell Labs.


# Question 2
# The definition of free software consists of four freedoms (freedoms 0 through 3). 
# Which of the following is NOT one of the freedoms that are part of the definition?

# Answer: The freedom to restrict access to the source code for the software.
# Comment: This is not part of the free software definition. Freedoms 1 and 3 
# require access to the source code.


# Question 3
# In R the following are all atomic data types EXCEPT

# Answer: data frame
# Comment: 'data frame' is not an atomic data type in R.


# Question 4
# If I execute the expression x <- 4L in R, what is the class of the object `x' 
# as determined by the `class()' function?

# Answer: integer
# Comment: The 'L' suffix creates an integer vector as opposed to a numeric vector.

x <- 4L
class(x)


# Question 5
# What is the class of the object defined by the expression x <- c(4, "a", TRUE)?

# Answer: character
# Comment: The character class is the "lowest common denominator" here and so all elements 
# will be coerced into that class. R does automatic coercion of vectors so that all 
# elements of the vector are the same data class.

x <- c(4, "a", TRUE)
class(x)


# Question 6
# If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by 
# the expression cbind(x, y)?

# Answer: A numeric matrix with 3 rows and 2 columns
# Comment: The 'cbind' function treats vectors as if they were columns of a matrix. 
# It then takes those vectors and binds them together column-wise to create a matrix.

x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x, y)


# Question 7
# A key property of vectors in R is that

# Answer: elements of a vector all must be of the same class

# Question 8
# Suppose I have a list defined as x <- list(2, "a", "b", TRUE). 
# What does x[[2]] give me?

# Answer: A character vector of length 1

x <- list(2, "a", "b", TRUE)
x[[2]]


# Question 9
# Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the 
# expression x + y?

# Answer: An integer vector with the values 3, 5, 5, 7
x <- 1:4
y <- 2:3
x + y


# Question 10
# Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements 
# of this vector that are less than 6 to be equal to zero. What R code achieves this?

# Answer: x[x <= 5] <- 0
# Comment: You can create a logical vector with the expression x <= 5 and then use 
# the [ operator to subset the original vector x.

x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0
x[x < 6] <- 0


# Questions 11 - 20
#Set the working directory and import the data
setwd("C:/Users/wwebb/Dropbox/GitHub/datasciencecoursera")
data <- read.csv("hw1_data.csv")


# Question 11
# In the dataset provided for this Quiz, what are the column names of the dataset?

# Answer: Ozone, Solar.R, Wind, Temp, Month, Day
# Comment: You can get the column names of a data frame with the `names()' function.


# Question 12
# Extract the first 2 rows of the data frame and print them to the console. What 
# does the output look like?
df <- data
head(df, 2)


# Question 13
# How many observations (i.e. rows) are in this data frame?
df <- data
nrow(df)


# Question 14
# Extract the last 2 rows of the data frame and print them to the console. What 
# does the output look like?
df <- data
tail(df, 2)


# Question 15
# What is the value of Ozone in the 47th row?
df <- data
df$Ozone[47]


# Question 16
# How many missing values are in the Ozone column of this data frame?
df <- data
missing <- is.na(df$Ozone)
numMissing <- sum(missing)
print(numMissing)


# Question 17
# What is the mean of the Ozone column in this dataset? 
# Exclude missing values (coded as NA) from this calculation.
df <- data
x <- mean(df$Ozone, na.rm = TRUE)
print(x)


# Question 18
# Extract the subset of rows of the data frame where Ozone values are 
# above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
df <- data
x <- subset(df, Ozone > 31 & Temp > 90)
print(x)
y <- mean(x$Solar.R)
print(y)


# Question 19
# What is the mean of "Temp" when "Month" is equal to 6?
df <- data
x <- subset(df, Month == 6)
print(x)
y <- mean(x$Temp)
print(y)


# Question 20
# What was the maximum ozone value in the month of May (i.e. Month = 5)?
df <- data
x <- subset(df, Month == 5)
print(x)
y <- max(x$Ozone, na.rm = TRUE)
print(y)
