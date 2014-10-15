CodeBook for the tidy dataset
======
Here you will find a brief descript of the dataset files, data, variables and transformations made to clean up the data.

#Dataset
As we know the dataset is the data collected from Samsung Galaxy S smartphones. A full description can be found here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

##Dataset files
From the dataset README file:
```
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

```

*It's worth noticing the lack of description for the file 'test/subject_test.txt'.*

#Transformation Goals
For this assignment it was asked to do the following steps:
```
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```
This was not the logic used to develop *run_analysis.R*.

#Implementation

##Variables

| Variable      | Description                                            |
|---------------|--------------------------------------------------------|
| data          | Test set and Train set merged                          |
| features      | Feature names                                          |
| final_data    | Tidy and final data                                    |
| new_data      | Temporary data to be casted                            |
| subject_test  | Instane subject for the test set                       |
| subject_train | Instane subject for the train set                      |
| test_data     | Data.frame with all columns relative to the test data  |
| train_data    | Data.frame with all columns relative to the train data |
| X_test        | Instances features for the test set                    |
| X_train       | Instances features for the train set                   |
| y_test        | Instance labels for the test set                       |
| y_train       | Instance labels for the train set                      |

##Methodology

* `reshape2` and `data.table` are loaded
* Features and activity labels are loaded
* Test and train data are loaded (X,y and subjects)
* Column names are updated to have the name of the features, subject or activiy label/id (4)
* New column is added for `y_test` and `y_train` containing the activity label (3,4)
* Columns of `X_test` and `X_train` containing `mean` or `std` are selected (2)
* The columns of two new data.frames are populated from the test and train data 
* Train and test data are merged (1)
* The mean for each activity performed by each subject is calculated. This is the final data (5)
* The data is writen into a file



Hope that was not too boring!