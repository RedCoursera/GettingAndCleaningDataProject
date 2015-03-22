###############################################################################
#
# run_analysis.R script for Getting and Cleaning Data Course Project
#
# input: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# output: text file created via write.text() using row.name=FALSE
#   and manually submitted on Coursera
#
# parameters: none; script will download data required to the working directory
#   if it doesn't already find it available there
# required R packages: dplyr (0.4.1) and stringr (0.6.2)
#
# data analysis performed on 3-16-2015 with R (3.1.2) on  Windows 7 x64
#
#
# Project Instructions:  Create a script that does the following...
#  1. Merges the training and the test sets to create one data set
#  2. Extracts only the measurements on the mean and standard deviation
#       for each measurement
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names
#  5. From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject
#
###############################################################################


# Step 0 - Preparation - load packages and get data

library(dplyr)
library(stringr)
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "getdata_projectfiles_UCI HAR Dataset.zip"

if(!file.exists("UCI HAR Dataset")) {
    if(!file.exists(zipFile)) {
        download.file(dataUrl,zipFile)
    }
    unzip(zipFile)
}


# Step 1 - Merge raw files into one data set

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt"
                            ,stringsAsFactors=FALSE)
yTest       <- read.table("UCI HAR Dataset/test/y_test.txt"
                            ,stringsAsFactors=FALSE)
xTest       <- read.table("UCI HAR Dataset/test/X_test.txt"
                            ,stringsAsFactors=FALSE
                            ,comment.char=""
                            ,colClasses="numeric")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt"
                            ,stringsAsFactors=FALSE)
yTrain      <- read.table("UCI HAR Dataset/train/y_train.txt"
                            ,stringsAsFactors=FALSE)
xTrain      <- read.table("UCI HAR Dataset/train/X_train.txt"
                            ,stringsAsFactors=FALSE
                            ,comment.char=""
                            ,colClasses="numeric")
features    <- read.table("UCI HAR Dataset/features.txt"
                            ,stringsAsFactors=FALSE
                            ,comment.char="")

test <- bind_cols(subjectTest,yTest,xTest)
train <- bind_cols(subjectTrain,yTrain,xTrain)
names <- c("Subject","Activity",features[,2])
dataAll <- rbind(test,train)
names(dataAll) <- names


# Step 2 - Extract mean() and std() measurements

data <- dataAll[,intersect(grep("Subject|Activity|mean|std",names(dataAll))
                           ,grep("Freq",names(dataAll),invert=TRUE))]


# Step 3 - Update activity name descriptions

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt"
                             ,stringsAsFactors=FALSE
                             ,col.names=c("Activity","ActivityDescription"))
data <- inner_join(data,activityLabels)
data <- data[,-2]


# Step 4 - Update variable labels; based on features_info.txt

# Note regarding reasoning for updated column names:
#  - kept abbreviations, considering the many nouns that make up the
#       column names, to keep length reasonable and minimize typing
#  - removed ( and ), as they are not syntactically valid per R documentation
#  - also removed invalid - (dashes) and replaced with underscores
#       for readability
#  - capitalized Mean and Std for consistency
# I understand that the course instructor prefers lowercase and no underscores
# based on the week 4 lectures.  Since the assignment instructions did not
# specify exact naming convention requirements, I updated the variable labels
# according to my preference, which is more readable in my personal opinion,
# and the way I would want to receive the data from someone else.
# Underscores and capitalization are syntactically valid per R documentation.

headers <- names(data)
headers <- str_replace_all(headers,"-","_")
headers <- str_replace(headers,"^t","Time")
headers <- str_replace(headers,"^f","Freq")
headers <- str_replace(headers,"mean\\(\\)","Mean")
headers <- str_replace(headers,"std\\(\\)","Std")
# fix error between features.txt and features_info.txt
headers <- str_replace(headers,"BodyBody","Body")
names(data) <- headers


# Step 5 - From now prepared data set, create summary output with averages
# of each variable by activity and subject

write.table(
    data %>% group_by(ActivityDescription,Subject) %>% summarise_each(funs(mean))
    ,file="TidyData.txt"
    ,row.names=FALSE)