# load libraries
library(plyr)
library(dplyr)

# load raw data
test <- read.table('./UCI HAR Dataset/test/X_test.txt', header=FALSE)
train <- read.table('./UCI HAR Dataset/train/X_train.txt', header=FALSE)
trainAct <- read.table('./UCI HAR Dataset/train/y_train.txt', header=FALSE)
testAct <- read.table('./UCI HAR Dataset/test/y_test.txt', header=FALSE)
featureNames <- read.table('./UCI HAR Dataset//features.txt', header=FALSE)
activities <- read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE)
testSubjects <- read.table('./UCI HAR Dataset/test/subject_test.txt', header= FALSE)
trainSubjects <- read.table('./UCI HAR Dataset/train/subject_train.txt', header= FALSE)

# merge data
combFeatures <- rbind(test, train)
combActivities <- rbind(testAct, trainAct)
combSubjects <- rbind(testSubjects, trainSubjects)
colnames(combFeatures) <- featureNames[, 2]
colnames(combSubjects) <- c("subject")
colnames(combActivities) <- c("activity_id")
colnames(activities) <- c("activity_id", "activity") 
combinedData <- cbind(combSubjects, combActivities, combFeatures)
combinedData <- join(combinedData, activities, by="activity_id")

# filter mean and std columns
meanAndStdCols <- which(grepl('mean()|std()', featureNames[,2])) + 2
meanAndStdCols <- c( 1, 564,meanAndStdCols)
meansAndStds <- combinedData[,meanAndStdCols]
meansAndStds <- group_by(meansAndStds, subject, activity)
summarized <- meansAndStds %>% summarise_each(funs(mean))
write.table(summarized, "./tidy_data.txt", row.names = FALSE)

