# Script for Course #3 Project
#
# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.

# load the packages
library(dplyr)
setwd("~/DataScience")

# Create data folder
if(!file.exists("data")) {
  dir.create("data")
}


# get the data, load it into data.frames
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./data/rundata.zip")
unzip("./data/rundata.zip") # unzips to the home dir
# C:\Users\lorit\Documents\DataScience\UCI HAR Dataset\test
# C:\Users\lorit\Documents\DataScience\UCI HAR Dataset\train
fileurl <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names"
download.file(fileurl,destfile = "./data/rundata.names")
 
col_names <- read.table("./UCI HAR Dataset/features.txt") # the variable names

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = col_names[,2]) # the values from the activity
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = as.factor(c("activity"))) # the activity
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = as.factor(c("subject"))) # the subject

#Activites: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",  col.names = col_names[,2])  # the values from the activity
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("activity")) 
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject")) # the subject

# ---------------------------------------------
# 1. Merges the training and the test sets to create one data set.
test <- cbind(X_test,y_test,subject_test)
train <- cbind(X_train,y_train,subject_train)
all <- rbind(test,train)

# ---------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std <- select(all, contains("mean"),contains("std"),activity,subject)

# ---------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
xlate_act <- function(x)
  {
    activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
    activities[x,2]
  }
mean_std <- mutate(mean_std, activity = xlate_act(mean_std$activity))

# ---------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names.

names(mean_std) <- gsub("\\.","",tolower(names(mean_std)))


# ---------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.
mean_std_grouped <- group_by(mean_std,activity,subject)
tidy_data <- summarise_all(mean_std_grouped,mean)
View(tidy_data)
write.table(tidy_data,"./data/tidy_data.txt",quote = FALSE, row.names = FALSE)


# To view the tidy_data set provided you can run the follow commands
# data <- read.table("./data/tidy_data.txt", header = TRUE) 
# View(data)

