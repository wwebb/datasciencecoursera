rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  
  # get list of unique states (in column 7)
  states <- unique(data[, 7])
  states
  
  # is the selected state valid?
  if ( !(state %in% states)) {
    stop("Invalid state selected. Try again!")
  }
  
  # identify the possible outcomes
  validOutcomes <- c("heart attack", "heart failure", "pneumonia")
  
  # match outcomes to a particular column in the data set
  if ( !(outcome %in% validOutcomes)) {
    stop("Invalid outcome selected. Try again!")
  }
  
  columnNames <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                   "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                   "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  )
  
  column <- columnNames[match(outcome, validOutcomes)]
  
  # Filter data set to pull hospitals for that state
  x <- data[data$State == state,]
  
  sorted <- x[order(as.numeric(x[[column]]), x[["Hospital.Name"]], decreasing = FALSE, na.last = NA), ]
  
  if (num == "best") {
    rank <- 1
  }
  else if (num == "worst") {
    rank <- nrow(sorted)
  }
  else {
    rank <- num
  }
  
  # Retrieve hospital name based on sorted rank number
  sorted[rank, "Hospital.Name"]
  
}