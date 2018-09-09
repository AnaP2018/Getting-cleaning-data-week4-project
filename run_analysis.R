
#################################################################

#The data linked to from the course website represent 
#data collected from the accelerometers from the 
#Samsung Galaxy S smartphone.

library(dplyr)

#################################################################
#Loading the file        
zippedfile<-"getdata_dataset.zip"

if (!file.exists(zippedfile)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(url, zippedfile, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(zippedfile) 
}
#################################################################
#Loading the data
#training sets
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainingActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainingTable <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingTable <- cbind(trainingSubjects, trainingActivities, trainingTable)

#test sets
testTable <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testTable <- cbind(testSubjects, testActivities, testTable)

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt", as.is=TRUE)

#################################################################

# 1.Merges the training and the test sets to create one data set. 
#Changes column names

#Create single data table
alldata<- rbind(trainingTable,testTable)

#Change Column names
colnames(alldata) <- c("subject","activity",features[, 2])
colnames(activityLabels)<-c("activity","typeActivity")


##################################################################
#2.Extracts only the measurements on the mean and standard deviation
# for each measurement.

# Identify columns with mean and standard deviation data
meanStdColumns <- grepl("subject|activity|mean|std", colnames(alldata))

#Store only above columns
alldata <- alldata[, meanStdColumns]

##################################################################

#3.Uses descriptive activity names to name the activities in the data set

alldata$activity <- factor(alldata$activity, 
  levels = activityLabels[, 1], labels = activityLabels[, 2])


##################################################################

#4.Appropriately labels the data set with descriptive variable names.

# get column names
alldataColumns <- colnames(alldata)

# clean column data
alldataColumns  <- gsub("[\\(\\)-]", "", alldataColumns )
alldataColumns  <- gsub("^f", "frequencyDomain", alldataColumns )
alldataColumns  <- gsub("^t", "timeDomain", alldataColumns )
alldataColumns  <- gsub("Acc", "Accelerometer", alldataColumns )
alldataColumns  <- gsub("Gyro", "Gyroscope", alldataColumns )
alldataColumns  <- gsub("Mag", "Magnitude", alldataColumns )
alldataColumns  <- gsub("Freq", "Frequency", alldataColumns )
alldataColumns  <- gsub("mean", "Mean", alldataColumns )
alldataColumns  <- gsub("std", "StandardDeviation", alldataColumns )
alldataColumns  <- gsub("BodyBody", "Body", alldataColumns )

# update column names
colnames(alldata) <- alldataColumns 

##################################################################

#5.From the data set in step 4, creates a second, independent tidy 
#data set with the average of each variable for each activity and each subject.

tidydata <- aggregate(. ~subject + activity, alldata, mean)
tidydata <- tidydata[order(tidydata$subject, tidydata$activity),]

# output to file "tidy_data.txt"
write.table(tidydata, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
