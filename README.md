getdata-peerassessment
======================

This is for my peer assessment in Coursera's Getting And Cleaning Data course from John Hopkins University

This repo contains run_analysis.R a script that will analyse the data provided and output a summary table, as well as the code book, saved as CodeBook.md

More details on run_analysis.R
==============================

The code is commented, but this is what it does...

It begins by downloading the zip file, so comment out lines 4-6 if it's already been downloaded to your working directory.

Next, it unzips the file, so you can also comment out line 9 if you have already done that.

Next it loads 8 text files into 8 dataframes which all retain their original names, the main two being X_test and X_train

The dataframe called features includes the names for the columns, which are converted to strings, collected in a vector and set as the column names of both X_test and X_train.

As the only data we need are the means and standard deviations, we search for all column heading containing either "mean" or "std" and remove all other columns. We do this early to make the tables require less memory, making them easier to work with.

Next we add two columns to the beginning of both X_test and X_train.

The first column is called Subject, and is populated by the observations in subject_test (or subject_train for X_train) once the have been converted to strings.

The second new column is called Activity, and is populated by the observations in y_test (or y_train), which contain a number referring to a name in the second second column of activity_labels.

Once this is complete, we combine X_test and X_train using cbind() to make X_merged.

Then we install the reshape2 package to allow us to quickly find the averages of all the mean and standard deviation values for each subject's six activities, in a new dataframe called X_averages.

Then we reorder X_averages by subject for ease of reading and write the table to a text file as required in the assessment.
