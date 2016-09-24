# Course :    Getting and Cleaning Data
# Project :   Final Projec Assignment
# Author :    Ramesh Sundaram
# COde Name : run_analysis.R

# Section 1
# Setting File Path for the Project Work
setwd("C:/CourseRa/Getting and Cleaning Data/Project Assignment/UCI HAR Dataset")

# Assigning the current path to the file_path variable
file_path <- file.path("C:/CourseRa/Getting and Cleaning Data/Project Assignment/UCI HAR Dataset")

# Storing all the files from the current directory to Files List variable ls_files
ls_files <- list.files(file_path, recursive=TRUE)

# Listing and printing the current files
ls_files

# Section 2
# Reading Test Activity Data and storing 
TestActivityData  <- read.table(file.path(file_path, "test" , "Y_test.txt" ),header = FALSE)

# Reading Training Activity Data
TrainActivityData <- read.table(file.path(file_path, "train", "Y_train.txt"),header = FALSE)

# Reading Test Subject Data
TestSubjectData  <- read.table(file.path(file_path, "test" , "subject_test.txt"),header = FALSE)

# Reading Training Subjesct Data
TrainSubjectData <- read.table(file.path(file_path, "train", "subject_train.txt"),header = FALSE)

# Reading Test Features Data
TestFeaturesData  <- read.table(file.path(file_path, "test" , "X_test.txt" ),header = FALSE)

# Reading Training Features Data
TrainFeaturesData <- read.table(file.path(file_path, "train", "X_train.txt"),header = FALSE)


# Section 3
# Merging the Train and Test Data of Acitivty, Subject and Features to create one data set

# Binding the data tables for Activity
MergedActivity <- rbind(TrainActivityData, TestActivityData)

# Binding the data tables for Subject
MergedSubject  <- rbind(TrainSubjectData, TestSubjectData)

# Binding the data tables for Features
MergedFeatures <- rbind(TrainFeaturesData, TestFeaturesData)

# Section 4
# Naming the Data Set to variables

names(MergedSubject) <- c("subject")

names(MergedActivity) <- c("activity")

# Reading Features into FeaturesNames variable
FeaturesNames <- read.table(file.path(file_path, "features.txt"),head=FALSE)

# Naming the MergedFeatures from for Features
names(MergedFeatures) <- FeaturesNames$V2


# Section 5
# Merging Subject and Activity data columns to get the data frame Data for all data

MergedData <- cbind(MergedSubject, MergedActivity)

AnalysisData <- cbind(MergedFeatures, MergedData)


# Getting the Mean -> mean() and Standard Deviation std()
FeaturesNames <- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

# Assiging the FeatureNames as the SelectedNames
SelectedNames <- c(as.character(FeaturesNames), "subject", "activity" )


AnalysisData <- subset(AnalysisData,select=selectedNames)

ActivityLabels <- read.table(file.path(file_path, "activity_labels.txt"),header = FALSE)

# Section 6
# Renameing the variables in AnalysisData with the meaniningful description.

# prefix t with time
names(AnalysisData) <- gsub("^t", "time", names(AnalysisData))

# prefix f with frequency
names(AnalysisData) <- gsub("^f", "frequency", names(AnalysisData))

# Acc wiht Accelerometer
names(AnalysisData) <- gsub("Acc", "Accelerometer", names(AnalysisData))

# Gyro with Gyroscope
names(AnalysisData) <- gsub("Gyro", "Gyroscope", names(AnalysisData))

# Mag with Magnitude
names(AnalysisData) <- gsub("Mag", "Magnitude", names(AnalysisData))

# BodyBody with Body
names(AnalysisData) <- gsub("BodyBody", "Body", names(AnalysisData))


# Section 7
library(plyr);

# Using aggregate function on AnalysisData to Created TidyData
TidyData <- aggregate(. ~subject + activity, AnalysisData, mean)

# TidyData is reordered for Subject and  Activity
TidyData <- TidyData[order(TidyData$subject,TidyData$activity),]

# Writing the Output Tidy Data to the tidydata.txt
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)


