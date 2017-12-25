Code works when Folder UCI HAR Dataset(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is in your working directory.


Load train and test data on activity, subject and features data : 

activity_train <- "y_train.txt"
subject_train <-"subject_train.txt" 
set_train <- "X_train.txt" 

activity_test <- "y_test.txt"
subject_test <- "subject_test.txt"
set_test <- "X_test.txt"

Merge test and train data sets to set_all with descriptive activity names to name the activities in the data set

Extracts only mesurments of mean() and std() to data.

Rename variables to unclude full names:
                                                    "TimeBodyAccelerometer-mean-X"                
 [3] "TimeBodyAccelerometer-mean-Y"                 "TimeBodyAccelerometer-mean-Z"                
 [5] "TimeBodyAccelerometer-std-X"                  "TimeBodyAccelerometer-std-Y"                 
 [7] "TimeBodyAccelerometer-std-Z"                  "TimeGravityAccelerometer-mean-X"             
 [9] "TimeGravityAccelerometer-mean-Y"              "TimeGravityAccelerometer-mean-Z"             
[11] "TimeGravityAccelerometer-std-X"               "TimeGravityAccelerometer-std-Y"              
[13] "TimeGravityAccelerometer-std-Z"               "TimeBodyAccelerometerJerk-mean-X"            
[15] "TimeBodyAccelerometerJerk-mean-Y"             "TimeBodyAccelerometerJerk-mean-Z"            
[17] "TimeBodyAccelerometerJerk-std-X"              "TimeBodyAccelerometerJerk-std-Y"             
[19] "TimeBodyAccelerometerJerk-std-Z"              "TimeBodyGyroscope-mean-X"                    
[21] "TimeBodyGyroscope-mean-Y"                     "TimeBodyGyroscope-mean-Z"                    
[23] "TimeBodyGyroscope-std-X"                      "TimeBodyGyroscope-std-Y"                     
[25] "TimeBodyGyroscope-std-Z"                      "TimeBodyGyroscopeJerk-mean-X"                
[27] "TimeBodyGyroscopeJerk-mean-Y"                 "TimeBodyGyroscopeJerk-mean-Z"                
[29] "TimeBodyGyroscopeJerk-std-X"                  "TimeBodyGyroscopeJerk-std-Y"                 
[31] "TimeBodyGyroscopeJerk-std-Z"                  "TimeBodyAccelerometerMagnitude-mean"         
[33] "TimeBodyAccelerometerMagnitude-std"           "TimeGravityAccelerometerMagnitude-mean"      
[35] "TimeGravityAccelerometerMagnitude-std"        "TimeBodyAccelerometerJerkMagnitude-mean"     
[37] "TimeBodyAccelerometerJerkMagnitude-std"       "TimeBodyGyroscopeMagnitude-mean"             
[39] "TimeBodyGyroscopeMagnitude-std"               "TimeBodyGyroscopeJerkMagnitude-mean"         
[41] "TimeBodyGyroscopeJerkMagnitude-std"           "FrequencyBodyAccelerometer-mean-X"           
[43] "FrequencyBodyAccelerometer-mean-Y"            "FrequencyBodyAccelerometer-mean-Z"           
[45] "FrequencyBodyAccelerometer-std-X"             "FrequencyBodyAccelerometer-std-Y"            
[47] "FrequencyBodyAccelerometer-std-Z"             "FrequencyBodyAccelerometerJerk-mean-X"       
[49] "FrequencyBodyAccelerometerJerk-mean-Y"        "FrequencyBodyAccelerometerJerk-mean-Z"       
[51] "FrequencyBodyAccelerometerJerk-std-X"         "FrequencyBodyAccelerometerJerk-std-Y"        
[53] "FrequencyBodyAccelerometerJerk-std-Z"         "FrequencyBodyGyroscope-mean-X"               
[55] "FrequencyBodyGyroscope-mean-Y"                "FrequencyBodyGyroscope-mean-Z"               
[57] "FrequencyBodyGyroscope-std-X"                 "FrequencyBodyGyroscope-std-Y"                
[59] "FrequencyBodyGyroscope-std-Z"                 "FrequencyBodyAccelerometerMagnitude-mean"    
[61] "FrequencyBodyAccelerometerMagnitude-std"      "FrequencyBodyAccelerometerJerkMagnitude-mean"
[63] "FrequencyBodyAccelerometerJerkMagnitude-std"  "FrequencyBodyGyroscopeMagnitude-mean"        
[65] "FrequencyBodyGyroscopeMagnitude-std"          "FrequencyBodyGyroscopeJerkMagnitude-mean"    
[67] "FrequencyBodyGyroscopeJerkMagnitude-std"      

table1 <- calculate mean for each valiable, subject and activity

table2 <- transforms data no tidy format with variable "signal" taking values: 

 [1] "FrequencyBodyAccelerometer-X"            "FrequencyBodyAccelerometer-Y"           
 [3] "FrequencyBodyAccelerometer-Z"            "FrequencyBodyAccelerometerJerk-X"       
 [5] "FrequencyBodyAccelerometerJerk-Y"        "FrequencyBodyAccelerometerJerk-Z"       
 [7] "FrequencyBodyAccelerometerJerkMagnitude" "FrequencyBodyAccelerometerMagnitude"    
 [9] "FrequencyBodyGyroscope-X"                "FrequencyBodyGyroscope-Y"               
[11] "FrequencyBodyGyroscope-Z"                "FrequencyBodyGyroscopeJerkMagnitude"    
[13] "FrequencyBodyGyroscopeMagnitude"         "TimeBodyAccelerometer-X"                
[15] "TimeBodyAccelerometer-Y"                 "TimeBodyAccelerometer-Z"                
[17] "TimeBodyAccelerometerJerk-X"             "TimeBodyAccelerometerJerk-Y"            
[19] "TimeBodyAccelerometerJerk-Z"             "TimeBodyAccelerometerJerkMagnitude"     
[21] "TimeBodyAccelerometerMagnitude"          "TimeBodyGyroscope-X"                    
[23] "TimeBodyGyroscope-Y"                     "TimeBodyGyroscope-Z"                    
[25] "TimeBodyGyroscopeJerk-X"                 "TimeBodyGyroscopeJerk-Y"                
[27] "TimeBodyGyroscopeJerk-Z"                 "TimeBodyGyroscopeJerkMagnitude"         
[29] "TimeBodyGyroscopeMagnitude"              "TimeGravityAccelerometer-X"             
[31] "TimeGravityAccelerometer-Y"              "TimeGravityAccelerometer-Z"             
[33] "TimeGravityAccelerometerMagnitude"      


