
setwd("C:/Users/Hchazelle/Desktop/Project")

# If the file already exists in the working directory, do nothing, else, download it and unzip it.

if (!file.exists("zipData")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "zipData")
  unzip(zipfile = "zipData")
}

#to read the 3 files from the test dataset and create 3 dataframes

myXtest <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
myYtest <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/test/y_test.txt", header = FALSE)
mySubjectTest <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#to merge the 3 test dataframes
mytest <- cbind(myXtest, myYtest, mySubjectTest)

#to read the 3 files from the training dataset and create 3 dataframes
myXtrain <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
myYtrain <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/train/y_train.txt", header = FALSE)
mySubjectTrain <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#to merge the 3 training dataframes
mytrain <- cbind(myXtrain, myYtrain, mySubjectTrain)

#to merge the training and test datasets
mydata <- rbind(mytest, mytrain)

#to rename the 563 variables of our merged dataset
myVarNames <- read.csv(file = "C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/features.txt", sep="", header=FALSE)
for (i in 1:561) {
  names(mydata)[i] <- as.character(myVarNames[i,2])
}
names(mydata)[562] <- "activity"
names(mydata)[563] <- "subject"

#to replace the values of the variable "activity" with descriptive values
myActivityLabels <- read.csv(file = "C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
for (i in 1:10299){
  for (j in 1:6) {
    if(mydata[i,562]==myActivityLabels[j,1]) {
      mydata[i,562] <- as.character(myActivityLabels[j,2])
    }
  }  
}

#to subset our dataframe on the 81 variables we want to keep
mydata <- mydata[,grepl("mean|std|subject|activity", names(mydata))]

#to group the observations by activity and subject calculating the average of each combination
myMeansbyGroups <- mydata %>%
group_by(subject, activity) %>%
summarise_all(mean)
myMeansbyGroups

#To create and read the new text file containing the dataset
write.table(x = myMeansbyGroups, "myTidyData.txt")
read.table("myTidyData", header = TRUE, sep = "")


       