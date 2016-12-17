# Part Two: Find the best hospital in the state.

# Objective::

# Write a function called 'best' that takes two arguments
# 1. 2-character abbreviated name of a state
# 2. an Outcome Name (heart attack, heart failure, pneumonia)

# reads the outcome-of-care-measures.csv

# returns character vector with the name of the hospital that has the best
# (lowest) 30-day mortality for a specified outcome
# Hospital names are provided in Hospital.Name variable

# Hospitals that do not have data on a particular outcome should be excluded
# from the set of hospitals when deciding rankings

# Handling Ties
#  win by alphabet b > c > f

# best <- function(state, outcome){
## Read outcome data

## Check that the state and outcome are valid
#       If invalid state, "invalid state"
#       if invalid outcome, "invalid outcome"

## Return hospital name in that state with lowest 30-day death rate

#}

# Test
setwd("B:/Data/public/Coursera/r-prog/ProgrammingAssignment3")
state <- "TX"
outcome <- "heart attack"


# Settings
outcomes <- c('heart attack' = 11, 'heart failure' = 17,'pneumonia' = 23)

# colums 2, 7, x

# Read Outcome data
df.outcome <- read.csv("data/outcome-of-care-measures.csv",
                       stringsAsFactors = FALSE,
                       na.strings = "Not Available")

        ## Check that the state and outcome at valid
        # invalid State
if((state %in% df.outcome$State)=="FALSE") stop("invalid state")
        # invalid outcome
if((outcome %in% names(outcomes))=="FALSE") stop("invalid outcome")

# Get the scores of the outcome we are interested in
scores <- df.outcome[which(df.outcome$State==state),c(2,7,outcomes[outcome])]

# Omit the NA values
scores.omit <- na.omit(scores)

# Order by rank, tie breaker by name
scores.order <- scores.omit[ order(scores.omit[,3],scores.omit[,1]),]

# Output rank 1
scores.order[1,1]
