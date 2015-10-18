corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!

  all_files <<- list.files(directory, full.names = TRUE)
  
  files <<- all_files
  
  # create empty vector to hold correlation values
  correlation <<- c()
  
  for (file in files) {
    
    # read all the data in each file
    data <<- read.csv(file)
    
    # Pull out only the completed cases from the dataset; the comma applies the logical
    # vector on all the columns in each row
    complete_data <<- data[complete.cases(data), ]
    
    if (nrow(complete_data) > threshold) {
      
      # calculate correlation between sulfate and nitrate and add it to correlation vector
      correlation <<- c(correlation, cor(complete_data$sulfate, complete_data$nitrate))
    }
    
  }
  
  return (correlation)
}