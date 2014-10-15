#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
library(data.table)

#Activities' names
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")[,2]
#Features' names
features = read.table("UCI HAR Dataset/features.txt")

#Lead X_test and y_test
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")

X_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

names(X_test)=features[,2]
names(X_train)=features[,2]


#Extracts only the measurements on the mean and standard deviation for each measurement. 
extracted_features = grepl("mean|std", features[,2])
X_test = X_test[,extracted_features]
X_train = X_train[,extracted_features]

#Add activity labels
y_test[,2] = activity_labels[y_test[,1]]
y_train[,2] = activity_labels[y_train[,1]]
names(y_test) = c("Activity_ID","Activity_Label")
names(y_train) = c("Activity_ID","Activity_Label")
names(subject_test) = "Subject"
names(subject_train) = "Subject"

test_data = cbind(X_test,subject_test,y_test)
train_data = cbind(X_train,subject_train,y_train)

#Merges the training and the test sets
data = rbind(test_data,train_data)

by_variables=c("Subject","Activity_ID","Activity_Label")
measure_labels = setdiff(names(data),by_variables)
new_data = melt(data, id=by_variables, measure.vars = measure_labels)

final_data = dcast(new_data, Subject + Activity_Label ~ variable, mean)
write.table(final_data, file = "final_data.txt",row.name=F)
