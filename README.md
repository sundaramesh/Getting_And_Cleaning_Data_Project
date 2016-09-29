Getting and Cleaning Data - Final Project Assignment

The run_analysis.R R Script assumes the Project Source data being extracted to the current working directory from the source link given for this project assignment

The files are available for analysis with directory specified.

The run_analysis.R script has 7 Sections that defines the steps performed in cleaning the data provided for the Project

Section 1 

Setting the File Path for the Project Work and assigning the current path to the file_path variable. This section also sorts all the files from the current directory to Files List variable ls_files

Section 2

Reading Test and Training data from the respective  data files into designated table variables. x_train, y_train, x_test, y_test, subject_train and subject_test files contain the data from the downloaded files.

Reading Training Activity Data, Test Subject Data, Training Subjesct Data, Reading Test Features Data and Training Features Data


Section 3

Merging the Train and Test Data of Acitivty, Subject and Features to create one data set. Binding the data tables for Activity, Subject and Features


Section 4

Naming the Data Set to variables and  readinding the Features data to FeatureNames Variables


Section 5
Merging Subject and Activity data columns to get the data frame Data for all data. Getting the Mean -> mean() and Standard Deviation std() and assiging the FeatureNames as the SelectedNames.


Section 6

Renameing the variables in AnalysisData with the meaniningful description. 
prefix t with time, prefix f with frequency, Acc wiht Accelerometer, Gyro with Gyroscope, Mag with Magnitude, BodyBody with Body


Section 7

Using aggregate function on AnalysisData to Created TidyData. TidyData is reordered for Subject and Activity and writing the Output Tidy Data to the tidydata.txt.

