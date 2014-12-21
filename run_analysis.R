## Load the data into R
x_train = read.table("train/X_train.txt")
y_train = read.table("train/y_train.txt")
subject_train = read.table("train/subject_train.txt")

x_test = read.table("test/X_test.txt")
y_test = read.table("test/y_test.txt")
subject_test = read.table("test/subject_test.txt")

## create the x, y and subject dataset
x = rbind(x_train, x_test)
y = rbind(y_train, y_test)
subject = rbind(subject_train, subject_test)

## Extracts the measurements on the mean and standard deviation
features = read.table("features.txt")
mean_sd = grep("-(mean|std)\\(\\)", features[,2])

## Subset the data
x = x[,mean_sd]
names(x) = features[mean_sd, 2]

## Use descriptive activity names to name the activities in the data set
activity_labels =  read.table("activity_labels.txt")
y[,1] = activity_labels[y[,1],2]
names(y) = "ACTIVITY"

## Appropriately labels the data set with descriptive variable names
names(subject) = "SUBJECT"
data = cbind(x, y, subject)

## Independent tidy data set with the average of each variable for each activity and each subject.
tidyData = aggregate(data[, names(data) != c("ACTIVITY", "SUBJECT")], 
                     by = list(ACTIVITY = data$ACTIVITY, SUBJECT = data$SUBJECT), mean)
write.table(tidyData, "tidyData.txt", row.name = FALSE)
