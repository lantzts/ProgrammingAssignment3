# setwd("B:/Data/public/Coursera/r-prog/ProgrammingAssignment3")


rankhospital <- function(state, outcome, num = "best"){
        ## Read outcome data
        outcomes <- c('heart attack' = 11, 
                      'heart failure' = 17,
                      'pneumonia' = 23)
        
        df.outcome <- read.csv("data/outcome-of-care-measures.csv",
                               stringsAsFactors = FALSE,
                               na.strings = "Not Available")
        
        ## Check that the state and outcome are valid
        #       If invalid state, "invalid state"
        if((state %in% df.outcome$State)=="FALSE") stop("invalid state")
        
        #       if invalid outcome, "invalid outcome"
        if((outcome %in% names(outcomes))=="FALSE") stop("invalid outcome")
        
        ## Return hospital name in the state with the given rank
        ## 30-day death rate
        scores <- df.outcome[which(df.outcome$State==state),
                             c(2,7,outcomes[outcome])]
        
        scores.omit <- na.omit(scores)
        scores.order <- scores.omit[ order(
                scores.omit[,3],
                scores.omit[,1]),]
        
        if(num=="best") scores.order[1,1] else 
                if(num=="worst") scores.order[nrow(scores.order),1] else 
                scores.order[num,1]
        

}






