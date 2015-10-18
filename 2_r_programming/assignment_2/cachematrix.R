# This function creates an object that stores matrices and can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  
  # default value of inverse
  inverse <- NULL
  
  # store the matrix
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  # return the matrix
  get <- function() x
  
  # set the inverse of the matrix 
  setinverse <- function(y) inverse <<- y
  
  # return the inverse of the matrix
  getinverse <- function() inverse
  
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


# This function returns the inverse matrix of a specified matrix
cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  
  # get the inverse of the matrix
  inverse <- x$getinverse()
  
  # check to see if the inverse of the matrix has been created - if so (not null)
  # the cached value of the inverse will be returned
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  # if the inverse was not returned above, retrieve the original matrix
  data <- x$get()
  
  # calculate the inverse of the original matrix
  inverse <- solve(data, ...)
  
  # store the inverse
  x$setinverse(inverse)
  
  inverse
  
}