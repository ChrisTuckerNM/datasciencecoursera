filestovector <- function(directory,id = 1:332)
{
    
    ##libs
    library(stringr)
    
    ## variables
    collecteddata <- vector()
    
    if(length(directory) != 1){
        return("error")}
    ## collect all files that are within the vector returned
    for(i in 1:length(id)){
        ## it is common for developers to assign interim steps in a process to 
        ## variables for troubleshooting purposes and readabilit, therefore what
        ## could be done in one line is done in several
        padded <- str_pad(string = id[i],3,side="left","0")
        filename <- paste(directory,"\\",padded,".csv",sep="")
        
        filedata <- read.csv(filename)
        collecteddata <- c(collecteddata,filedata)
        x
    }
    collecteddata
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    ##print(collecteddata)
   
    collecteddata <-filestovector(directory,id)
    completeddata <- complete.cases(collecteddata[pollutant])
    mean(completeddata)
   
}

complete <- function(directory,id=1:332){
    c(id=1,nobs=2)
    collecteddata <-filestovector(directory,id)
}