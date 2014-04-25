We are given data on two trials (one referred to as test and one referred to as train), spread across several files, and it is our job to merge this into one table of tidy data which contains the averages of the values we're interested in.  The merging and tidying is automated by the script run_analysis.R, the algorithms of which are explained in README.md as well as in comments in the code itself.

We create eight dataframes, of the same names as the text files provided to us.  They are...

- 'X_train': Training set.
- 'X_test': Test set.
- 'y_train': Training labels.
- 'y_test': Test labels.
- 'features': List of all features.
- 'activity_labels': Links the class labels with their activity name.
- 'subject_test': Each row identifies the subject who performed the activity. Its range is from 1 to 30. 
- 'subject_train': Each row identifies the subject who performed the activity. Its range is from 1 to 30. 

run_analysis.R will create some other dataframes whilst working.  These are...

- 'X_merged': Combines the Training and Test sets once they are both in the correct format.
- 'X_melt': Melts X_merged in order to reshape it with the averages.
- 'X_averages': Recasts X_melt with all the averages for each subjects six activities.  This is the final table written to the output file.

It also creates a handful of variables...

- 'Activity': A vector used to store the activities before being added as a column to the X_train and X_test dataframes.
- 'Subject': A vector used to store the Subjects before being added as a column to the X_train and X_test dataframes.
- 'names': A vector used to store the column headings.
- 'nums': The numbers 1 to 30 saved as strings to be used for levels to order the final dataframe by Subject.
- 'keep': A vector of column numbers that contain either "mean" or "std" in the name.
- 'i': use to count the for loops.

X_averages.txt
==============

run_analysis.R spits out a file called X_averages.txt that is 180 rows and 81 columns.
The 180 rows relate to 30 Subjects each completing 6 Activities.
After ID columns for Subject and Activity, there are a further 79 for variables...

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
