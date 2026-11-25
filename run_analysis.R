# Downloading the data directly from the URL
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile="mydata.zip", mode="wb")

#Extracting the zipped 
unzip("mydata.zip")

#Loading the training data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt") #training data
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt") #label data for the training data
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt") #subject IDs for the training data

#Loading testing data
test_data <- read.table("UCI HAR Dataset/test/X_test.txt") #test data
test_labels <- read.table("UCI HAR Dataset/test/Y_test.txt") #labels for the testing data
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt") #subject IDs for the testing data

#----- 1 Combining the training and testing data
all_data <- rbind(train_data, test_data)

#----- 2 Extracting measurements on the mean and standard deviation
#Naming each measurement in the dataset 
features <- read.table("UCI HAR Dataset/features.txt") #data describing each feature
colnames(features) <- c("No.", "Feature") #renaming the columns for easier interpretation
colnames(all_data) <- features$Feature #naming the measurement data columns according their respective features

#Creating a new dataset containing only measurements on mean and standard deviation
mean_std_data <- all_data[, grepl("mean|std", names(all_data))]

#----- 3 Adding activity data to the mean_std_data
#Creating the activity labels for the training and testing data
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt") #labels for training data 
colnames(train_labels) <- "Label"

test_labels <- read.table("UCI HAR Dataset/test/Y_test.txt") #labels for the testing data
colnames(test_labels) <- "Label"

all_labels <- rbind(train_labels, test_labels) #combining the labels for training and testing data

#Activities are labelled from 1-6 where [1] Walking, [2] WALKING_UPSTAIRS, [3] WALKING_DOWNSTAIRS,
# [4] SITTING, [5] STANDING, [6] LAYING
#Changing the labels to the actual activity names
all_labels$Activity <- ifelse(all_labels$Label == 1, "Walking", 
                            ifelse(all_labels$Label == 2, "WALKING_UPSTAIRS", 
                                   ifelse(all_labels$Label==3, "WALKING_DOWNSTAIRS", 
                                          ifelse(all_labels$Label==4, "SITTING", 
                                                 ifelse(all_labels$Label==5, "STANDING", 
                                                        ifelse(all_labels$Label==6, "LAYING", NA))))))

mean_std_data <- cbind(all_labels, mean_std_data) #combining the activity data to the measurement data from step 2

#----- 5 Creating a tidy dataset from mean_std_data containing the average of each variable for each activity and each subject 
#Creating the subject IDs for the training and testing data
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt") #subject IDs for the training data
colnames(train_subjects) <- "Subject_ID"

test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt") #subject IDs for the testing data
colnames(test_subjects) <- "Subject_ID"

all_sampleID <- rbind(train_subjects, test_subjects) #combining the Subject IDs for training and testing data

mean_std_data <- cbind(all_sampleID, mean_std_data) #combining the subject IDS to the measurement data from step 2

#creating a new data set containing average data for each measurement from the mean_std_data grouped by sample_ID and Activity
tidy_data_mean <- mean_std_data %>% aggregate(.~Subject_ID +Activity, FUN = mean) 

write.table(tidy_data_mean, "tidy_data_mean.txt", row.names = FALSE)
