Course Project for Getting and Cleaning Data
===============================================

This repository holds the required files for the course project of the
"Getting and Cleaning Data" course on Coursera. There are two relevant files: 

- run_analysis.R : script to run the analysis, i.e. make a tidy dataset
- CodeBook.md : documents all the variables in the resulting tidy dataset, and 
explains what manipulations have been performed on the data. 

The dataset we will use is the "Human Activity Recognition Using Smartphones"
dataset, which can be found on the UCI Machine Learning web page: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data in this dataset were obtained from inertial sensors in smartphones that
were carried (on the waist) by 30 subjects while they were performing their
daily activities. Measurements were taken at a rate of 50Hz, and sampled in
sliding windows of 2.56s. 

For each subject, and each time window, there is information on 561 "features",
i.e. different measurements using the raw information of the sensors. 
The type of activity that was performed during that time window is also available. 

The data in the dataset are divided across several files. One of the main goals 
of the run_analysis.R script will be to put all the relevant data together in 
one dataframe. 
Once that is done, we will do some basic summarizing, namely, we will compute 
the mean of selected features for each subject and activity combination. 
This information will be stored in the final, tidy dataset.

The analysis script is structured in the following way:  

1. Download the raw data from the web.
2. Read the names of the features and the activities from their 
respective files.
3. Process the main datasets and join them together. 
The following items will be done in this step: 
      + Read the main dataset and add the names of the features and activities. 
      + Read the file with subject id and append it to the main dataset.
      + Select only the subset of the features we are interested in. 
4. Create the desired tidy dataset.
      + Compute the mean of the selected features
      + Store it in a tidy data frame. 
      + Sort the columns and rows for easy reading and possible subsequent plotting
5. Write the data frame to a file. 

In the run_analysis.R script, each of these steps is divided by a horizontal 
line for clarity. 

