# setwd("B:/Data/public/Coursera/r-prog/ProgrammingAssignment3")
outcome <- "pneumonia"
num <- "worst"

rankall <- function( outcome, num = "best"){
        
        ## function to get declared rank
        
        hospname <- function(data){
                if(num=="best") data[1,1] else
                        if(num=="worst") data[nrow(data),1] else
                                data[num,1]   
        }
        
        ## settings
        
        outcomes <- c('heart attack' = 11, 
                      'heart failure' = 17,
                      'pneumonia' = 23)
        
        ## Read outcome data

        df.outcome <- read.csv("data/outcome-of-care-measures.csv",
                               stringsAsFactors = FALSE,
                               na.strings = "Not Available")
        
        ## Check that the outcome is valid

        if((outcome %in% names(outcomes))=="FALSE") stop("invalid outcome")
        
        ## get scores for selected outcome
        
        scores <- df.outcome[,c(2,7,outcomes[outcome])]
        
        ## omit scores with NA values
        
        scores.omit <- na.omit(scores)

        ## order the scores by rank, tiebreak by hospital name
        
        scores.order <- scores.omit[ order(
                scores.omit[,3],
                scores.omit[,1]),]
        
        ## split the data frame by state
        
        scores.split <- split(scores.order, scores.order$State)
        
        ## pick off the selected rank for each state
        
        scores.pick <- lapply(scores.split, hospname)
        
        # bring it all together
        
        data.frame(hospital = unlist(scores.pick), 
                   state = names(scores.pick),
                   row.names = names(scores.pick))
}






