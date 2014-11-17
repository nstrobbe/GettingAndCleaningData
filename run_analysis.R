################################################################################
## This script will perform all necessary steps to create the tidy dataset 
## as requested in the assignment. 
################################################################################

## Source the libraries we will need.
library(dplyr)
library(reshape2)

## -----------------------------------------------------------------------------

## Function to get the raw data.
## Only downloads and unzips the file if necessary. 
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

## Number of rows to run; useful for testing purposes
nrows.to.run <- -1

## Read the feature names. These will be used as the column names 
## of the X_train and X_test datasets. 
## The names will be converted into more readable names later. 
features.names <- read.table(paste(base.dir,"features.txt",sep="")
                             , row.names = 1
                             , stringsAsFactors = FALSE) 
  
## Read in the activity names
activity.names <- read.table(paste(base.dir,"activity_labels.txt",sep="")
                             , row.names = 1)
## Get the names as a factor vector.
## This will be used to replace the activity numbers in the main dataset.
activity.factor <- activity.names[[1]]

## -----------------------------------------------------------------------------

## Function to read the main datasets and do the first set of processing.
## Takes either "train" or "test" as input.
my.process.df <- function(datatype="train"){
  # Read the subject id file.
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
  
  # Read the data and assign column names. Read.table() will automatically 
  # deal with duplicate names by appending a .i to the name, where i is an 
  # index (e.g. .1 means this is the second encounter of that name). 
  # Select only the columns corresponding to the mean() and std() of the variables. 
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

## Join both data frames together and then remove the separate data frames
full.df <- rbind(train.X, test.X)
rm(train.X)
rm(test.X)

## -----------------------------------------------------------------------------

## Make the requested tidy dataset 

## Define function to rename the feature names, getting rid of the ... and .. 
## in the names. 
my.rename <- function(x){
  temp.x <- gsub("...",".",x,fixed=TRUE)
  gsub("..","",temp.x,fixed=TRUE)
}

## Melt the dataset and then do a dcast.
## This will get the mean for each feature per subject and activity.
## Rename the features to more readable names using the above defined function.
## Arrange the rows by Subject.ID and Activity to make possible subsequent 
## steps, such as plotting, easier. 
tidy.df <- melt(full.df
                  , id.vars = c("Subject.ID", "Activity")) %>%
  dcast(Subject.ID + Activity ~ variable, mean) %>%
  select_(.dots = setNames(names(full.df)
                           , my.rename(names(full.df))
                           ) 
          ) %>%
  arrange(as.numeric(levels(Subject.ID))[Subject.ID], Activity)

## Rearrange the columns so that they are in alphabetical order. 
## This is not really necessary, but I find it cleaner. 
tidy.df <- select_(tidy.df
                   , .dots = c("Subject.ID"
                               , "Activity"
                               , sort(names(tidy.df)[3:68])
                               )
                   )

## Now we have our tidy dataset in a wide format. 
## The columns are Subject.ID, Activity, and the average for each feature. 
## One row contains one observation: the averages for all features for a given 
## subject doing a particular activity. 

## -----------------------------------------------------------------------------

## The only thing remaining, is to write the dataset to a file.
write.table(tidy.df, "tidy_dataset.txt", row.names=FALSE)
