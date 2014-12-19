# Getting and Cleaning Data Course Project

The data for the project can be download from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Steps to run the analysis:

1. Download and unzip the data.

2. Move the data and the script into R working directory.

3. Install ```data.table package``` if it does not exist.

4. Type ```source("run_analysis.R")``` at the console to execute the script.

The ```run_analysis.R``` does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.