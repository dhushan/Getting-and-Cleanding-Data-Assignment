Getting-and-Cleanding-Data-Assignment
=====================================

Course Assignment

Assignment Goal:

The purpose of this code is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

===================================================================
Study Design:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

=============================================================================
How the script works:
The flow of the data script follows the following sequence to form an independent tidy data set with the average of each variable for each activity and each subject.

	1.	Merged the training and the test sets to create one data set.  The data frame (Dataset) is formed from the following files (note: files in the folder Inertial Signals were excluded):
	⁃	subject_test / subject_train
	⁃	X_test / X_train
	⁃	Y_test / Y_train
	
	2.	Appropriately labels the data set with descriptive variable names
	⁃	Condition = labels origin of data set - Train or Test
	⁃	Activity = 1:6 
	⁃	Subjects = 1:30
	⁃	Sensor signals (accelerometer and gyroscope) data is labelled using names front the text file feature.txt.
	
	3. Extracts only the measurements on the mean and standard deviation for each measurement.
	⁃	Formed a new dataset (DataSet2) that only contained mean and standard deviation (excluded meanFreq)
	
	4.	Uses descriptive activity names to name the activities in the data set
	⁃	Added descriptive names to the activities 
	
	5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	⁃	Formed a new dataset (DataSet3) with the average of each variable for each activity and each subject
===================================================================

Codebook:

Sensor Signal Definitions

Subject: 1 - 30,  group of 30 volunteers within an age bracket of 19-48 years
Activity :   six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 

- GravityACC - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'

- BodyACC: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- BodyGyro: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

mean(): Mean value  of 128 element vector, with the average of each variable for each activity and each subject. 

std(): Standard Deviation value  of 128 element vector, with the average of each variable for each activity and each subject. 
