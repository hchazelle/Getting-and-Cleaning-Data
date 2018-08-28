install.packages("dplyr")
library(dplyr)


setwd("C:/Users/Hchazelle/Desktop/Project")

if (!file.exists("zipData")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "zipData")
  unzip(zipfile = "zipData")
}



myXtest <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
myYtest <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/test/y_test.txt", header = FALSE)
mySubjectTest <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

mytest <- cbind(myXtest, myYtest, mySubjectTest)

myXtrain <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
myYtrain <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/train/y_train.txt", header = FALSE)
mySubjectTrain <- read.csv(file="C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

mytrain <- cbind(myXtrain, myYtrain, mySubjectTrain)

mydata <- rbind(mytest, mytrain)

myVarNames <- read.csv(file = "C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/features.txt", sep="", header=FALSE)

for (i in 1:561) {
  names(mydata)[i] <- as.character(myVarNames[i,2])
}

names(mydata)[562] <- "activity"
names(mydata)[563] <- "subject"

myActivityLabels <- read.csv(file = "C:/Users/Hchazelle/Desktop/Project/UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

for (i in 1:10299){
  for (j in 1:6) {
    if(mydata[i,562]==myActivityLabels[j,1]) {
      mydata[i,562] <- as.character(myActivityLabels[j,2])
    }
  }  
}

mydata <- mydata[,grepl("mean|std|subject|activity", names(mydata))]
myMeansbyGroups <- mydata %>%
  group_by(subject, activity) %>%
    summarise_all(mean)

myMeansbyGroups

write.table(x = myMeansbyGroups, "myTidyData.txt")
read.table("myTidyData", header = TRUE, sep = "")


       