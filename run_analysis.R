
#This Script is to process the X_test and X_train datasets for the purpose of
#extracting means, grouped by subject(person) and activity, of variables that are 
#themselves calculations of means and standard deviations

# The resulting data frames of mergedData (the combination of the two datasets with 
# subject and activity added) 
# and datameanstd(the subject of extracted variables with mean grouped by subject and activity)
#
# The UCI HAR Dataset folder containing the datasets is assumed to be in a subfolder (UCI HAR Dataset) of your current directory
#
#read in both datasets
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")

#read in the subject and y (activity) datasets
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")

# change the name of the variables before adding the two to the X-.. files
names(y_test) <- "activity"
names(subject_test) <- "subject"
names(y_train) <- "activity"
names(subject_train) <- "subject"


#update the number id of column activity to their corresponding activity names
a <- y_test == 1
y_test[a,] <- "WALKING"
a <- y_test == 2
y_test[a,] <- "WALKING_UPSTAIRS"
a <- y_test == 3
y_test[a,] <- "WALKING_DOWNSTAIRS"
a <- y_test == 4
y_test[a,] <- "SITTING"
a <- y_test == 5
y_test[a,] <- "STANDING"
a <- y_test == 6
y_test[a,] <- "LAYING"
a <- y_train == 1
y_train[a,] <- "WALKING"
a <- y_train == 2
y_train[a,] <- "WALKING_UPSTAIRS"
a <- y_train == 3
y_train[a,] <- "WALKING_DOWNSTAIRS"
a <- y_train == 4
y_train[a,] <- "SITTING"
a <- y_train == 5
y_train[a,] <- "STANDING"
a <- y_train == 6
y_train[a,] <- "LAYING"



#add activity and subject columns to each X-.. files
X_test <- cbind(y_test,X_test)
X_test <- cbind(subject_test,X_test)

X_train <- cbind(y_train,X_train)
X_train <- cbind(subject_train,X_train)


#merge the X_test and X_train files with all matched variables
mergedData <- merge(X_train,X_test,all=TRUE)


#read in features.txt file to get the variable names for the mergedData file
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"",stringsAsFactors = FALSE)
#update names of variables to mergedData file
names(mergedData)[3:563] <- c(features$V2)


#meanStdColumns <- grep("mean()|std()", features$V2, value = FALSE)

meanStdColumnsNames <- grep("mean\\(\\)|std", features$V2, value = TRUE)
meanStdColumnsNames <- c("subject","activity",meanStdColumnsNames)


#extract a subset data frame for all variables that calculate the mean and standard deviation for
#each of the measurement columns
mysubset <- subset(mergedData, select = c(meanStdColumnsNames))



#using dplyr library  install.packages("dplyr)
library(dplyr)


#Perform a group_by for subject,activity, then a summarise_each 
#to execute the mean function across the remaining columns.

testgroup <- group_by(mysubset,subject,activity)
datameanstd<-summarise_each(testgroup,funs(mean))

# write out contents of data frame datameanstd to file datameanstd.txt
write.table(datameanstd,"datameanstd.txt", row.name=FALSE)


