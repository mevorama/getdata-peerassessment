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
