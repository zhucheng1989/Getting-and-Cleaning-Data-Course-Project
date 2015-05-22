# Getting-and-Cleaning-Data-Course-Project
R Script for Getting and Cleaning Data Course Project

This script is to clean the data about an experinment about Human Activity Recognition Using Smartphones.
More details you can get from link : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Read table
Firstly, you need to read data into R by using 'read.table()'.
And name them clearly to identify 'x' 'y' 'subject' and 'label'. Of course you need differentiate the 'train' and 'test' dataset.

# Merges the training and the test sets
Using 'cbind' to combine the 'x' 'y' and 'subject' dataset.
And using 'rbind' to union the 'train' and 'test' dataset.

# Extracts only the measurements on the mean and standard deviation for each measurement
Firstly you need identify which measurement is on the mean and standard deviation.
You can use 'grep' function and the 'Regular Expression' to select the measurements needed.

# Uses descriptive activity names to name the activities in the data set
Activity names are stored in a special table.
You can use 'merge' function to join the table.

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
You need to get the current released version of 'reshape2' packages from CRAN.
Then use 'melt' and 'dcast' function to calculate.
