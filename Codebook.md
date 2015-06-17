
#Course Project Code Book
The data used for this project was collected from the accelerometers in the Samsung Galaxy S smartphone for the propose of analyzing activity information. This file provides links to the data and describes the variables and any transformations.
This project uses data collected from the link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
with a full description of the data obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##Data Files
The relevant data files can be found in the unzipped file downloaded from the link above. These files include:
  - README.txt
  - activity_labels.txt: links the numeric label with the activity type
  - features.txt: list of all the features
  - features_info.txt: shows information about the variables used for the feature vector
  - test/X_test.txt: test set 
  - test/subject_test.txt: test subject number
  - train/y_test.txt: test lables 
  - train/X_train.txt: training set 
  - train/subject_train.txt: training subject numbers
  - train/y_train.txt: training labels
The data values have been normalized and bound between [-1,1] and the data is stored in row vectors.

##Feature Selection (Format of Tidy Data)
There are six types of activities that can be found in the data:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

The signals are time domain signals from data collected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, captured at a rate of 50 Hz. The data was then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Using a low pass Butterworth filter with corner frequency of 0.3 Hz, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

Additionally, Jerk was measured using linear acceleration and angular velocity (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

##Variable Names:
- tBodyAcc-mean-X
- tBodyAcc-mean-Y
- tBodyAcc-mean-Z
- tBodyAcc-std-X
- tBodyAcc-std-Y
- tBodyAcc-std-Z
- tGravityAcc-mean-X
- tGravityAcc-mean-Y
- tGravityAcc-mean-Z
- tGravityAcc-std-X
- tGravityAcc-std-Y
- tGravityAcc-std-Z
- tBodyAccJerk-mean-X
- tBodyAccJerk-mean-Y
- tBodyAccJerk-mean-Z
- tBodyAccJerk-std-X
- tBodyAccJerk-std-Y
- tBodyAccJerk-std-Z
- tBodyGyro-mean-X
- tBodyGyro-mean-Y
- tBodyGyro-mean-Z
- tBodyGyro-std-X
- tBodyGyro-std-Y
- tBodyGyro-std-Z
- tBodyGyroJerk-mean-X
- tBodyGyroJerk-mean-Y
- tBodyGyroJerk-mean-Z
- tBodyGyroJerk-std-X
- tBodyGyroJerk-std-Y
- tBodyGyroJerk-std-Z
- tBodyAccMag-mean
- tBodyAccMag-std
- tGravityAccMag-mean
- tGravityAccMag-std
- tBodyAccJerkMag-mean
- tBodyAccJerkMag-std
- tBodyGyroMag-mean
- tBodyGyroMag-std
- tBodyGyroJerkMag-mean
- tBodyGyroJerkMag-std
- fBodyAcc-mean-X
- fBodyAcc-mean-Y
- fBodyAcc-mean-Z
- fBodyAcc-std-X
- fBodyAcc-std-Y
- fBodyAcc-std-Z
- fBodyAccJerk-mean-X
- fBodyAccJerk-mean-Y
- fBodyAccJerk-mean-Z
- fBodyAccJerk-std-X
- fBodyAccJerk-std-Y
- fBodyAccJerk-std-Z
- fBodyGyro-mean-X
- fBodyGyro-mean-Y
- fBodyGyro-mean-Z
- fBodyGyro-std-X
- fBodyGyro-std-Y
- fBodyGyro-std-Z
- fBodyAccMag-mean
- fBodyAccMag-std
- fBodyBodyAccJerkMag-mean
- fBodyBodyAccJerkMag-std
- fBodyBodyGyroMag-mean
- fBodyBodyGyroMag-std
- fBodyBodyGyroJerkMag-mean
- fBodyBodyGyroJerkMag-std

##Transformations:
Steps taken in processing the original data:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

