# gettingandcleaningdata
Course Project for Getting and Cleaning Data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This repository contains three files
1) README.md
2) Codebook.md
3) run_analysis.R

1) README.md : This file has details about the background information on this project as well as introduction to various files in this repository  
2) Codebook.md: Describes variables in the dataset  
3) run_analysis.R : R script that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The steps used by R script to accomplish above are as follows :
-Getting data using download.file()
- setting appropriate working directory using setwd()
- unzipping the downloaded file
- using list.files() to get name of the unzipped file
- reading files using read.table()
- Merging all training data with cbind
- Merging all test data with cbind
- Merging training and test data with rbind
- Assigning lables using names()
- Extracting only the measurements on the mean and standard deviation for each measurements using 'grepl'
- Loading plyr package to use 'join'
- Labelling  the data set with descriptive variable names using 'gsub'
- Creating  a second,independent tidy data set (avgbyact.txt) and output it using write.table()
