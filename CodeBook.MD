Introduction

CodeBook.md describes the steps performed under various Sections of the the code. The variable defintion and the data, used are handled to analyze and clean the data. The R Code can be launched in RStudio by extracting the file to the current directory

The output of the tidy data is named as tidydata.txt and uploaded.

The script run_analysis.R performs the 5 steps described in the course project's definition.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

A similar approach is taken with activity names through the activities variable.
all_data merges x_data, y_data and subject_data in a big dataset.

Finally, the data contains the relevant averages which will be later stored in a tidydat.txt file. The plyr package is used to apply aggregate and ease the development.
