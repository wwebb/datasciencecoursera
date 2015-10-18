rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available")
  
  # get list of unique states (in column 7)
  validState = sort(unique(data[,7]))
  
  validOutcomes = c("heart attack", "heart failure", "pneumonia")
  
  # check for valid income
  if (!outcome %in% validOutcomes) { 
    stop("invalid outcome")
  }
  
  columnNames <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                   "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                   "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  )
  
  column <- columnNames[match(outcome, validOutcomes)]
  
  
  hospitalList <- character(0)
  
  # retrieve hospital name for each state at specified rank
  for (i in seq_along(validState)) {
    
    x <- data[data$State==validState[i],]
    
    
    sorted <- x[order(as.numeric(x[[column]]), x[["Hospital.Name"]], decreasing = FALSE, na.last=NA), ]
    
    if (num == "best") {
      rank <- 1
    }
    else if (num == "worst") {
      rank <- nrow(sorted)
    }
    else {
      rank <- num
    }
    
    hospitalList[i] <- sorted[rank,"Hospital.Name"]
  }
  
  # return hospital name based on rank
  data.frame(hospital = hospitalList, state = validState, row.names = validState)
}