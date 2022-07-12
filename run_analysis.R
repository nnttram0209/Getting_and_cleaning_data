library(dplyr)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "Coursera_Proj_Data.zip", method = "curl")
unzip("Coursera_Proj_Data.zip")

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

Data_X <- rbind(x_train, x_test)
Data_Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Data_Final <- cbind(Subject, Data_Y, Data_X)

Data_Tidied <- Data_Final %>% select(subject, code, contains("mean"), contains("std"))
Data_Tidied$code <- activities[Data_Tidied$code,2]

names(Data_Tidied)[2] <- "activity"
names(Data_Tidied) <- gsub("Acc", "Accelerometer", names(Data_Tidied))
names(Data_Tidied) <- gsub("Gyro", "Gyroscope", names(Data_Tidied))
names(Data_Tidied) <- gsub("BodyBody", "Body", names(Data_Tidied))
names(Data_Tidied) <- gsub("Mag", "Magnitude", names(Data_Tidied))
names(Data_Tidied) <- gsub("^t", "Time", names(Data_Tidied))
names(Data_Tidied) <- gsub("^f", "Frequency", names(Data_Tidied))
names(Data_Tidied) <- gsub("tBody", "TimeBody", names(Data_Tidied))
names(Data_Tidied) <- gsub("-mean()", "Mean", names(Data_Tidied), ignore.case = TRUE)
names(Data_Tidied) <- gsub("-std()", "STD", names(Data_Tidied), ignore.case = TRUE)
names(Data_Tidied) <- gsub("-freq()", "Frequency", names(Data_Tidied), ignore.case = TRUE)
names(Data_Tidied) <- gsub("angle", "Angle", names(Data_Tidied))
names(Data_Tidied) <- gsub("gravity", "Gravity", names(Data_Tidied))

DF <- Data_Tidied %>% 
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(DF, "DF_Final.txt", row.name=FALSE)

DF
str(DF)
