################################################################################
## This script will create the tidy dataset as requested in the assignment. 
################################################################################

## Source the libraries we will need
library(dplyr)

## -----------------------------------------------------------------------------

## Function to read in the raw data and convert it to a data frame. 
## Downloads and unzips the file if necessary. 
getRawData <- function(input.filename = "raw_data.zip") {
  # Web address of the dataset we will use
  location <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  # If the data is not there, we need to download and unzip
  if(!file.exists("UCI HAR Dataset")){
    # Check whether the zipped file is there, otherwise download it
    if(!file.exists(input.filename)) {
      download.file(location, destfile=input.filename, method="curl")
    }
    # Now that we have the zipped file, we can unzip it
    unzip(input.filename)
  }
}

## Make sure we have the data
getRawData()

## -----------------------------------------------------------------------------

## Avoid typos
base.dir <- "UCI HAR Dataset/"

## Read the feature names
## We will use those as the column names of the X_train and X_test datasets
features.names <- read.table(paste(base.dir,"features.txt",sep="")
                             , row.names = 1
                             , stringsAsFactors = FALSE)

## Read in the activity names
activity.names <- read.table(paste(base.dir,"activity_labels.txt",sep="")
                             , row.names = 1)
## Get the names as a factor vector
## Will use this to replace the activity numbers in the main dataset
activity.factor <- activity.names[[1]]

## Number of rows to run; useful for testing purposes
nrows.to.run <- 10

## Function to read and process the main datasets
## Takes either "train" or "test" as input
my.process.df <- function(datatype="train"){
  # Read the subject id file
  # Make the id's into a factor variable, will be useful later
  subjects <- read.table(paste(base.dir,datatype,"/subject_",datatype,".txt", sep="")
                         , nrows = nrows.to.run
                         , colClasses = "factor"
                         , col.names = "Subject.ID")

  # Read the activity file, and change the numbers to their proper names.
  # Do it here rather than in the big df for possible speed increase.
  activity <- read.table(paste(base.dir,datatype,"/y_",datatype,".txt",sep="")
                         , nrows = nrows.to.run
                         , col.names = "Activity") %>%
    mutate(Activity=activity.factor[Activity])
  
  # Read the data and assign proper column names.
  # Select only the columns corresponding to the mean() and std() 
  # of the variables. 
  # Add the subject id and the activity information columns. 
  my.df <- read.table(paste(base.dir,datatype,"/X_",datatype,".txt",sep="")
                       , quote = ""
                       , nrows = nrows.to.run
                       , colClasses = "numeric"
                       , col.names = features.names[[1]]) %>%
    select(contains("mean", ignore.case=FALSE)
           , contains("std")
           , -contains("meanFreq")) %>%
    cbind(subjects) %>%
    cbind(activity) 
  
}

## Process the data from both train and test
train.X <- my.process.df("train")
test.X <- my.process.df("test")

## Join both dataframes together
full.df <- rbind(train.X, test.X)
rm(train.X)
rm(test.X)

