# setwd("B:/Data/public/Coursera/r-prog/ProgrammingAssignment3")


best <- function(state, outcome){
## Read outcome data
outcomes <- c('heart attack' = 11, 'heart failure' = 17,'pneumonia' = 23)

df.outcome <- read.csv("data/outcome-of-care-measures.csv",
                       stringsAsFactors = FALSE,
                       na.strings = "Not Available")

## Check that the state and outcome are valid
#       If invalid state, "invalid state"
if((state %in% df.outcome$State)=="FALSE") stop("invalid state")

#       if invalid outcome, "invalid outcome"
if((outcome %in% names(outcomes))=="FALSE") stop("invalid outcome")

## Return hospital name in that state with lowest 30-day death rate
scores <- df.outcome[which(df.outcome$State==state),c(2,7,outcomes[outcome])]
scores.omit <- na.omit(scores)
scores.order <- scores.omit[ order(scores.omit[,3],scores.omit[,1]),]
scores.order[1,1]

}






