run_analysis <- function() {

## download zip file - skip if downloaded manually
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, destfile="getdata-projectfiles-UCI HAR Dataset.zip", method="curl")
        dateDownloaded <- date()

## unzip data - skip if you have unzipped manually
        unzip("getdata-projectfiles-UCI HAR Dataset.zip")

## get data into R
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")

## set column names
        names <- c()
        for (i in 1:nrow(features)){
                names <- c(names, as.character(features[i,2]))
        }
        colnames(X_test) <- names
        colnames(X_train) <- names

## remove columns without mean or std
        keep <- grep("mean|std",names)
        X_test <- X_test[,keep]
        X_train <- X_train[,keep]

## add Activity and Subject columns to X_test
        Subject <- c()
        Activity <- c()
        for (i in 1:nrow(y_test)){
                Subject[i] <- as.character(subject_test[i,1])
                Activity[i] <- as.character(activity_labels[y_test[i,1],2])
        }
        X_test <- cbind(Subject, Activity, X_test)

## add Activity and Subject columns to X_train
        Subject <- c()
        Activity <- c()
        for (i in 1:nrow(y_train)){
                Subject[i] <- as.character(subject_train[i,1])
                Activity[i] <- as.character(activity_labels[y_train[i,1],2])
        }
        X_train <- cbind(Subject, Activity, X_train)

## merge test and train into X_merged
        X_merged <- rbind(X_test, X_train)

## install the reshape2 package for dataframe melting
        install.packages("reshape2")
        library(reshape2)

## create new data frame, X_averages, for the averages
        X_melt <- melt(X_merged,id=c("Subject","Activity"))
        X_averages <- dcast(X_melt, Subject + Activity ~ variable, mean)

## put subjects in ascending order
        nums <- as.character(seq(1:30))
        X_averages$Subject <- factor(X_averages$Subject,levels=nums)
        X_averages <- X_averages[order(X_averages$Subject,X_averages$Activity),]

## writes the txt file that is required
        write.table(X_averages, file = "X_averages.txt")

}