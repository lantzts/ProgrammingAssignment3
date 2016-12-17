# Part One: Plot the 30-day mortality rates for heart attack
# There is nothing to submit for this part

# Read the outcome data into R via the read.csv function and look at the first
# few rows.

outcome <- read.csv('outcome-of-care-measures.csv', colClasses = "character")
head(outcome)

# A lot of colummns
ncol(outcome)
names(outcome)

# Histogram of 30-day death rates from heart attack (column 11)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

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

