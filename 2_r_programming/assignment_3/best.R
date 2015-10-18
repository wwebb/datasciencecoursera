best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
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
  
  # Return hospital that has lowest mortality rate in selected state for a
  # particular outcome
  
  x <- data[data$State == state,]
  index <- which.min(as.double(x[, column]))
  x[index, "Hospital.Name"]  
  
}