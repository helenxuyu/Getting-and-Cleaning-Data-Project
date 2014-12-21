This is a code book that describes the variables, the data, and any transformations or work to clean up the data.

The Problem and Data Source:

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Transformations:

The data getting and cleaning work contains 5 steps.

1. Merges the train and the test sets to create one data set.
For x, y and subject, merge the training and test datasets respectively.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use regular expression matching to find measurements on the mean and standard deviation, then subset the x to keep only mean and standard deviation measurements.

3. Uses descriptive activity names to name the activities in the data set
Replace activity numbers in y with activity labels.

4. Appropriately labels the data set with descriptive activity names.
Add appropriate column names for x, y and subject, then combine the three datasets.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Calculate average of each variable for each activity and each subject.

Variables:

x, y and data are merged results of training and test data.
required features are all the mean and standard deviation features, x will be subsetted with required features.

data is the combination of x, y and subject.
A similar approach is taken with activity names through the activities variable.
tidyData contains the relevant mean of each variable for each activity and each subject.