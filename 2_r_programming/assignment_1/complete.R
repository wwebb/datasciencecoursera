complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  all_files <<- list.files(directory, full.names = TRUE)
  
  files <<- all_files[id]
  
  # Initialize empty results matrix
  results <<- data.frame(id = rep(0, length(id)), nobs = rep(0, length(id)))
  
  for (i in 1:length(files)) {
    data <<- read.csv(files[i])
    
    # complete.cases results logical vector where a row has no missing values
    good <<- complete.cases(data)
    
    results[i,1] <- id[i]
    
    # summing the logical vector returns number of complete cases
    results[i,2] <- sum(good)
  }
  
  print (results)
  
  
}