# Course Project for Cleaning Data Course

##Course Project for Cleaning data Coursera Course

The CodeBook.md details the extraction of the subset required process and the resulting variables.
The run_analysis.R file is the script that will actually result in a merged dataset(mergedData data frame) and the subset of means dataset(datameanstd data frame).
The other others in repo are;
 README.txt - the orginal readme for the original datasets, which outlines the collection of the data
 features.txt - the original variables list for the complete dataset.
 features_info.txt  - A more detailed look at the original variables and how the measurements were acquired and processed
  
 
### Steps taken for process of tidying the data and extracting and grouping the mean and standard deviation variables.  

  * Read in both original datasets X_test.txt and X_train.txt
  * Read in the subject and y (activity) datasets, subject_test.txt, subject_train.txt, y_test.txt, y_train.txt
  * Change the names of the variables subject and activity in the resulting data frames to make adding combining and merging processes easier
  * Update the number id of column activity in each data frame to their corresponding activity names ie, 1 = WALKING
  * Add each activity and subject dataframe to their corresponding data within either X_test or X_train.
  * Merge the two main dataframes, X_test or X_train, matching all variables to mergedData data frame
  * Read in features.txt file to get the variable names for the mergedData data frame to features data frame
  * Update the mergedData data frame with all the corresponding descriptive variable names from features data frame
  * Extract list of variable names from the mergedData data frame that contains the strings mean() or std()
  * Add the activity and subject strings to this list.
  * Extract a subset of only the variables identified above.
  * Perform a group_by for subject,activity
  * Use summarise_each to execute the mean function across the remaining columns. 
  

