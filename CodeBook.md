CodeBook for tidy_dataset.txt 
================================

Note: this codebook is best viewed on github, or somewhere else where the 
markdown is properly read in. 

### Introduction

The input data for this study is the "Human Activity Recognition Using Smartphones"
dataset, which can be found on the UCI Machine Learning web page: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This CodeBook will detail all manipulations that were done to this data in order
to arrive at the tidy dataset that is stored in the `tidy_dataset.txt` file 
to which this CodeBook belongs. The structure of the tidy dataset and the meaning 
of all variable names is also included. 

### Data manipulations

Several actions were performed on the original dataset. 

First, the measurements for all subjects and all time windows were read into R. 
The column names were taken from the `features.txt` file in the original dataset. 
The subject id and activity type for each separate measurement were appended to 
the dataset. 

Then the data was subsetted to only retain the variables, or "features", that
provide information on the mean or standard deviation of the measurements. 
We decided to drop the meanFreq features as these are not direct means of the
variables we are interested in. 

The train and test samples were added together for this analysis, and the 
original variable names have been cleaned up. 

We computed the mean of each selected variable, for each subject and
activity combination. This information constitutes the final tidy dataset with
which we can do more analysis later on. The dataset was also sorted by subject 
id and acitivy, and the columns are arranged in alphabetical order. 

### Structure of the final dataset

The final dataset contains 180 rows of observations, and 68 columns. 
The first column is an id number associated to a given subject, 
the second column contains the activity that the subject was performing, and the 
remaining 66 columns contain the mean of various measurements, computed over the 
length of time that the subject was performing a certain activity. 

### List of all variables in the dataset

Variables 3-68 follow a specific naming convention. This allows for concise
variable names that still incode all relevant information, and are readable. 

The name consists of 3 basic parts: 

1. *t* or *f* to denote *time* or *frequency* domain variables. A fast-fourier
transform was applied to the *f* variables already in the original data set. 
2. The signal that is being measured. 
3. *mean* or *std* to indicate whether the mean or standard deviation of the 
measured signal is reported. These are computed over one timing(frequency) window. 

On top of this there can be a *X*, *Y* or *Z* appended to indicate components 
along the X, Y or Z direction for the 3-axial variables. 

For clarity there is a **.** between parts 2 and 3, and parts 3 and 4 in the 
variable names. 

1. **Subject.ID**  
Identification number of the subject, ranges from 1 to 30.
2. **Activity**  
Type of activity the subject was performing. Can take following values: 
      * WALKING
      * WALKING_UPSTAIRS
      * WALKING_DOWNSTAIRS
      * SITTING
      * STANDING
      * LAYING
1. **fBodyAccJerkMag.mean**  
Mean value for the magnitude of the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerkMag.std**  
Standard deviation for the magnitude of the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerk.mean.X**  
Mean value along the X-direction for the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerk.mean.Y**  
Mean value along the Y-direction for the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerk.mean.Z**  
Mean value along the Z-direction for the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerk.std.X**  
Standard deviation along the X-direction for the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerk.std.Y**  
Standard deviation along the Y-direction for the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccJerk.std.Z**  
Standard deviation along the Z-direction for the jerk of the linear body acceleration in the frequency domain. 
1. **fBodyAccMag.mean**  
Mean of the magnitude of the linear body acceleration in the frequency domain. 
1. **fBodyAccMag.std**  
Standard deviation of the linear body acceleration in the frequency domain. 
1. **fBodyAcc.mean.X**  
Mean value along the X-direction for the linear body acceleration in the frequency domain. 
1. **fBodyAcc.mean.Y**  
Mean value along the Y-direction for the linear body acceleration in the frequency domain. 
1. **fBodyAcc.mean.Z**  
Mean value along the Z-direction for the linear body acceleration in the frequency domain. 
1. **fBodyAcc.std.X**  
Standard deviation for the X-direction for the linear body acceleration in the frequency domain. 
1. **fBodyAcc.std.Y**  
Standard deviation for the Y-direction for the linear body acceleration in the frequency domain. 
1. **fBodyAcc.std.Z**  
Standard deviation for the Z-direction for the linear body acceleration in the frequency domain. 
1. **fBodyGyroJerkMag.mean**  
Mean value of the magnitude of the jerk of the body angular velocity in the frequency domain. 
1. **fBodyGyroJerkMag.std**  
Standard deviation of the magnitude of the jerk of the body angular velocity in the frequency domain. 
1. **fBodyGyroMag.mean**  
Mean value of the magnitude of the body angular velocity in the frequency domain. 
1. **fBodyGyroMag.std**  
Standard deviation of the magnitude of the body angular velocity in the frequency domain. 
1. **fBodyGyro.mean.X**  
Mean value along the X direction of the body angular velocity in the frequency domain. 
1. **fBodyGyro.mean.Y**  
Mean value along the Y direction of the body angular velocity in the frequency domain. 
1. **fBodyGyro.mean.Z**  
Mean value along the Z direction of the body angular velocity in the frequency domain. 
1. **fBodyGyro.std.X**  
Standard deviation along the X direction of the jerk of the body angular velocity in the frequency domain. 
1. **fBodyGyro.std.Y**  
Standard deviation along the Y direction of the jerk of the body angular velocity in the frequency domain.  
1. **fBodyGyro.std.Z**  
Standard deviation along the Z direction of the jerk of the body angular velocity in the frequency domain. 
1. **tBodyAccJerkMag.mean**  
Mean value of the magnitude of the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerkMag.std**  
Standard deviation of the magnitude of the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerk.mean.X**  
Mean value along the X direction for the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerk.mean.Y**  
Mean value along the X direction for the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerk.mean.Z**  
Mean value along the X direction for the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerk.std.X**  
Standard deviation along the X direction for the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerk.std.Y**  
Standard deviation along the Y direction for the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccJerk.std.Z**  
Standard deviation along the Z direction for the jerk of the linear body acceleration in the time domain. 
1. **tBodyAccMag.mean**  
Mean value of the magnitude for the linear body acceleration in the time domain. 
1. **tBodyAccMag.std**  
Standard deviation of the magnitude for the linear body acceleration in the time domain. 
1. **tBodyAcc.mean.X**  
Mean value along the X direction for the linear body acceleration in the time domain. 
1. **tBodyAcc.mean.Y**  
Mean value along the Y direction for the linear body acceleration in the time domain. 
1. **tBodyAcc.mean.Z**  
Mean value along the Z direction for the linear body acceleration in the time domain. 
1. **tBodyAcc.std.X**  
Standard deviation along the X direction for the linear body acceleration in the time domain. 
1. **tBodyAcc.std.Y**  
Standard deviation along the Y direction for the linear body acceleration in the time domain. 
1. **tBodyAcc.std.Z**  
Standard deviation along the Z direction for the linear body acceleration in the time domain. 
1. **tBodyGyroJerkMag.mean**  
Mean value of the magnitude of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerkMag.std**  
Standard deviation of the magnitude of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerk.mean.X**  
Mean value along the X direction of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerk.mean.Y**  
Mean value along the Y direction of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerk.mean.Z**  
Mean value along the Z direction of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerk.std.X**  
Standard deviation along the X direction of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerk.std.Y**  
Standard deviation along the Y direction of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroJerk.std.Z**  
Standard deviation along the Z direction of the jerk of the body angular velocity in the time domain. 
1. **tBodyGyroMag.mean**  
Mean value of the magnitude of the body angular velocity in the time domain. 
1. **tBodyGyroMag.std**  
Standard deviation of the magnitude of the body angular velocity in the time domain. 
1. **tBodyGyro.mean.X**  
Mean value along the X direction of the body angular velocity in the time domain. 
1. **tBodyGyro.mean.Y**  
Mean value along the Y direction of the body angular velocity in the time domain. 
1. **tBodyGyro.mean.Z**  
Mean value along the Z direction of the body angular velocity in the time domain. 
1. **tBodyGyro.std.X**  
Standard deviation along the X direction of the body angular velocity in the time domain. 
1. **tBodyGyro.std.Y**  
Standard deviation along the Y direction of the body angular velocity in the time domain. 
1. **tBodyGyro.std.Z**  
Standard deviation along the Z direction of the body angular velocity in the time domain. 
1. **tGravityAccMag.mean**  
Mean value of the magnitude of the gravity acceleration in the time domain. 
1. **tGravityAccMag.std**  
Standard deviation of the magnitude of the gravity acceleration in the time domain. 
1. **tGravityAcc.mean.X**  
Mean value along the X direction of the gravity acceleration in the time domain. 
1. **tGravityAcc.mean.Y**  
Mean value along the Y direction of the gravity acceleration in the time domain. 
1. **tGravityAcc.mean.Z**  
Mean value along the Z direction of the gravity acceleration in the time domain. 
1. **tGravityAcc.std.X**  
Standard deviation along the X direction of the gravity acceleration in the time domain. 
1. **tGravityAcc.std.Y**  
Standard deviation along the Y direction of the gravity acceleration in the time domain. 
1. **tGravityAcc.std.Z**  
Standard deviation along the Z direction of the gravity acceleration in the time domain. 

