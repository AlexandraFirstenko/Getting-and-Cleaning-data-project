#According to instructions folder "UCI HAR Dataset" should be in your WD for this code to work
#load packages
library(data.table)
library(dplyr)
library(tidyr)

#load data from UCI HAR Dataset into R 

activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", sep=" ")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep=" ")
set_train <- read.table("UCI HAR Dataset/train/X_train.txt")
set_train$subject <- subject_train[["V1"]]
set_train$activity <- activity_train[["V1"]]
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep=" ")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep=" ")
set_test <- read.table("UCI HAR Dataset/test/X_test.txt")
set_test$subject <- subject_test[["V1"]]
set_test$activity <- activity_test[["V1"]]

#Merges the training and the test sets to create one data set.
set_all <- rbind(set_test, set_train)
features <- read.table("UCI HAR Dataset/features.txt", sep=" ")
colnames(set_all)<- c(as.character(features[["V2"]]),"subject","activity")

#Extracts only the measurements on the mean and standard deviation for each measurement.
extract <- set_all[,grep("std|mean",names(set_all))]
#subtract meanFreq, as it is not mean() mesurment, it is meanFreq() mesurment
extract_2 <- extract[,grep("meanFreq",names(extract), invert = TRUE)]
extract_2 <- cbind(extract_2, set_all$subject, set_all$activity)
data <- tbl_df(extract_2)

#Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("V1","activity"))
data <- merge(activity,data,by.x = "V1",  by.y = 'set_all$activity')
data$subject <- data$'set_all$subject'
data <- select(data, -1,-69)

#Appropriately labels the data set with descriptive variable names.
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("\\()", "", names(data))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

table1 <- data %>% group_by(subject,activity) %>% summarise_all(funs(mean)) 
table2 <- table1 %>% gather(key = signals, value = value, -subject, -activity)  %>%
       separate(col = signals, into= c("signal","var","direction"), sep = "-") %>%
        unite(col = "signal", "signal","direction", sep = "-") %>%
        spread(key = "var", value = value)

 table2$signal <- gsub("-NA","", table2$signal)
 write.table(table2, file="tidy.txt",row.names=FALSE, col.names=TRUE, sep="\t", quote=TRUE)

