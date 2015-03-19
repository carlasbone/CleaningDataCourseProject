# CodeBook for Cleaning Data Course Project dataset 'datameanstd'
The extracted subset, 'datameanstd', of the combination of the X_test and X_train datasets which shows the means of variables grouped by subject and activity
The variable names correspond directly to the original variables from the merged dataset to avoid further confusion as to source of these means.
Please see features.txt and features.info for information of the origin of the variable names and computations.

Data used in computations are from the study that represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
Please see link http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  for more information on this study.

The data comprised of two files of test and training data which is the study of 30 subjects roughly divided 30% and 70% respectively that measured each subject performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, data was captured for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
For further details on this and the processes used in the data capturing and filters used in the processing process, please see the Readme.txt file.

The purpose of this project is to extract a subset, from the combined datasets, of means of any variables that had mean and standard deviation calculations, grouped by subject and activity. 

The R code for this process is in the run_analysis.R file.  This assumes the dataset files are a subfolder named 'UCI HAR Dataset' in the R current directory.  The R package 'dplyr' is also required.

Steps taken for this process.  
  Read in both original datasets X_test.txt and X_train.txt
  Read in the subject and y (activity) datasets, subject_test.txt, subject_train.txt, y_test.txt, y_train.txt
  Change the names of the variables subject and activity in the resulting data frames to make adding combining and merging processes easier
  Update the number id of column activity in each data frame to their corresponding activity names ie, 1 = WALKING
  Add each activity and subject dataframe to their corresponding data within either X_test or X_train.
  Merge the two main dataframes, X_test or X_train, matching all variables to mergedData data frame
  Read in features.txt file to get the variable names for the mergedData data frame to features data frame
  Update the mergedData data frame with all the corresponding descriptive variable names from features data frame
  Extract list of variable names from the mergedData data frame that contains the strings mean() or std()
  Add the activity and subject strings to this list.
  Extract a subset of only the variables identified above.
  Perform a group_by for subject,activity
  Use summarise_each to execute the mean function across the remaining columns. 
  


### Variables from dataset 'datameanstd'

"subject"
	subject
		The id number of the person of 30 that has taken part in the study

"activity"
	activity
		The activity type for which the measurements were taken
			* LAYING
			* SITTING
			* STANDING
			* WALKING
			* WALKING_DOWNSTAIRS
			* WALKING_UPSTAIRS
		
"tBodyAcc-mean()-X"
	The mean by subject and activity of the mean times of body acceleration signal for X axial signal direction
"tBodyAcc-mean()-Y"
	The mean by subject and activity of the mean times of body acceleration signal for Y axial signal direction
"tBodyAcc-mean()-Z" 
	The mean by subject and activity of the mean times of body acceleration signal for Z axial signal direction
"tBodyAcc-std()-X" 
	The mean by subject and activity of the standard deviation of body acceleration signal for X axial signal direction
"tBodyAcc-std()-Y"
	The mean by subject and activity of the standard deviation of body acceleration signal for Y axial signal direction
"tBodyAcc-std()-Z"
	The mean by subject and activity of the standard deviation of body acceleration signal for Z axial signal direction
"tGravityAcc-mean()-X"
	The mean by subject and activity of the mean times of gravity acceleration signal for X axial signal direction
"tGravityAcc-mean()-Y"
	The mean by subject and activity of the mean times of gravity acceleration signal for Y axial signal direction
"tGravityAcc-mean()-Z"
	The mean by subject and activity of the mean times of gravity acceleration signal for Z axial signal direction
"tGravityAcc-std()-X"
	The mean by subject and activity of the standard deviation of times of gravity acceleration signal for X axial signal direction
"tGravityAcc-std()-Y"
	The mean by subject and activity of the standard deviation of times of gravity acceleration signal for Y axial signal direction
"tGravityAcc-std()-Z"
	The mean by subject and activity of the standard deviation of times of gravity acceleration signal for Z axial signal direction
"tBodyAccJerk-mean()-X"
	The mean by subject and activity of the mean times of the Body Jerk signals for X axial signal direction
"tBodyAccJerk-mean()-Y"
	The mean by subject and activity of the mean times of the Body Jerk signals for Y axial signal direction
"tBodyAccJerk-mean()-Z"
	The mean by subject and activity of the mean times of the Body Jerk signals for Z axial signal direction
"tBodyAccJerk-std()-X"
	The standard deviation by subject and activity of the standard deviation of times of the body linear acceleration signals for X axial signal direction
"tBodyAccJerk-std()-Y"
	The mean by subject and activity of the standard deviation of times of the body linear acceleration signals for Y axial signal direction
"tBodyAccJerk-std()-Z"
	The mean by subject and activity of the standard deviation of times of the body linear acceleration signals for Z axial signal direction
"tBodyGyro-mean()-X"
	The mean by subject and activity of the mean times of the Body gyroscope signals for X axial signal direction
"tBodyGyro-mean()-Y"
	The mean by subject and activity of the mean times of the Body gyroscope signals for Y axial signal direction
"tBodyGyro-mean()-Z"
	The mean by subject and activity of the mean times of the Body gyroscope signals for Z axial signal direction
"tBodyGyro-std()-X"
	The mean by subject and activity of the standard deviation of the Body gyroscope signals for X axial signal direction
"tBodyGyro-std()-Y"
	The mean by subject and activity of the standard deviation of the Body gyroscope signals for Y axial signal direction
"tBodyGyro-std()-Z"
	The mean by subject and activity of the standard deviation of the Body gyroscope signals for Z axial signal direction
"tBodyGyroJerk-mean()-X"
	The mean by subject and activity of the mean times of the body angular velocity signals for X axial signal direction
"tBodyGyroJerk-mean()-Y"
	The mean by subject and activity of the mean times of the body angular velocity signals for X axial signal direction
"tBodyGyroJerk-mean()-Z"
	The mean by subject and activity of the mean times of the body angular velocity signals for Z axial signal direction
"tBodyGyroJerk-std()-X"
	The mean by subject and activity of the standard deviation of the body angular velocity signals for X axial signal direction
"tBodyGyroJerk-std()-Y"
	The mean by subject and activity of the standard deviation of the body angular velocity signals for Y axial signal direction
"tBodyGyroJerk-std()-Z"
	The mean by subject and activity of the standard deviation of the body angular velocity signals for Z axial signal direction
"tBodyAccMag-mean()"
	The mean by subject and activity of the mean times of the magnitude of body linear acceleration signals times
"tBodyAccMag-std()"
	The mean by subject and activity of the standard deviation of the magnitude of body linear acceleration signals times
"tGravityAccMag-mean()"
	The mean by subject and activity of the mean times of the magnitude of gravity acceleration signals times
"tGravityAccMag-std()"
	The standard deviation by subject and activity of the standard deviation of the magnitude of gravity acceleration signals times
"tBodyAccJerkMag-mean()"
	The mean by subject and activity of the mean times of the magnitude of Body Jerk signals times
"tBodyAccJerkMag-std()"
	The mean by subject and activity of the standard deviation of the magnitude if Body Jerk signals times
"tBodyGyroMag-mean()"
	The mean by subject and activity of the mean times of the magnitude of Body gyroscope signals times
"tBodyGyroMag-std()"
	The mean by subject and activity of the standard deviation of magnitude of Body gyroscope signals times
"tBodyGyroJerkMag-mean()"
	The mean by subject and activity of the mean times of the magnitude of body angular velocity signals times
"tBodyGyroJerkMag-std()"
	The mean by subject and activity of the standard deviation of the magnitude of body angular velocity signals times
"fBodyAcc-mean()-X"
	The mean by subject and activity of the mean frequency of the magnitude of body acceleration signals for X axial signal direction
"fBodyAcc-mean()-Y"
	The mean by subject and activity of the mean frequency of the magnitude of body acceleration signals for Y axial signal direction
"fBodyAcc-mean()-Z"
	The mean by subject and activity of the mean frequency of the magnitude of body acceleration signals for Z axial signal direction
"fBodyAcc-std()-X"
	The standard deviation by subject and activity of the standard deviation of frequency body acceleration signal for X axial signal direction
"fBodyAcc-std()-Y"
	The mean by subject and activity of the standard deviation of frequency body acceleration signal for Y axial signal direction
"fBodyAcc-std()-Z"
	The mean by subject and activity of the standard deviation of frequency body acceleration signal for Z axial signal direction
"fBodyAccJerk-mean()-X"
	The mean by subject and activity of the mean frequency of the Body Jerk signals for X axial signal direction
"fBodyAccJerk-mean()-Y"
	The mean by subject and activity of the mean frequency of the Body Jerk signals for Y axial signal direction
"fBodyAccJerk-mean()-Z"
	The mean by subject and activity of the mean frequency of the Body Jerk signals for Z axial signal direction
"fBodyAccJerk-std()-X"
	The mean by subject and activity of the standard deviation of frequency of the Body Jerk signals for X axial signal direction
"fBodyAccJerk-std()-Y"
	The mean by subject and activity of the standard deviation of frequency of the Body Jerk signals for Y axial signal direction
"fBodyAccJerk-std()-Z"
	The mean by subject and activity of the standard deviation of frequency of the Body Jerk signals for Z axial signal direction
"fBodyGyro-mean()-X"
	The mean by subject and activity of the mean frequency of the Body gyroscope signals for X axial signal direction
"fBodyGyro-mean()-Y"
	The mean by subject and activity of the mean frequency of the Body gyroscope signals for Y axial signal direction
"fBodyGyro-mean()-Z"
	The mean by subject and activity of the mean frequency of the Body gyroscope signals for Z axial signal direction
"fBodyGyro-std()-X"
	The mean by subject and activity of the standard deviation of frequency of the Body gyroscope signals for X axial signal direction
"fBodyGyro-std()-Y"
	The mean by subject and activity of the standard deviation of frequency of the Body gyroscope signals for Y axial signal direction
"fBodyGyro-std()-Z"          
	The mean by subject and activity of the standard deviation of frequency of the Body gyroscope signals for Z axial signal direction
"fBodyAccMag-mean()"
	The mean by subject and activity of the mean frequency of the magnitude of body linear acceleration signals 
"fBodyAccMag-std()"
	The mean by subject and activity of the standard deviation of frequency of the magnitude of body linear acceleration signals
"fBodyBodyAccJerkMag-mean()"
	The mean by subject and activity of the mean frequency of the magnitude of Body Jerk signals
"fBodyBodyAccJerkMag-std()"
	The mean by subject and activity of the standard deviation of frequency of the magnitude of Body Jerk signals
"fBodyBodyGyroMag-mean()"
	The mean by subject and activity of the mean of frequency of the magnitude of Body gyroscope signals
"fBodyBodyGyroMag-std()"
	The mean by subject and activity of the standard deviation of frequency of the body angular velocity signals
"fBodyBodyGyroJerkMag-std()"
	The mean by subject and activity of the standard deviation of frequency of the magnitude of Body gyroscope signals
