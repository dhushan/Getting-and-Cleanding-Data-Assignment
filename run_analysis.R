#The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set.
#The goal is to prepare tidy data that can be used for later analysis. 

#Data Set information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#load data 
if(!file.exists("data")) {
        dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/Data.zip",method = "curl")
data <- unzip("./data/Data.zip")

# Merges the training and the test sets to create one data set.

Train_Subjects<-read.table(data[14])
Train_Features<-read.table(data[15])
Train_Activty<-read.table(data[16])

DataSet <- cbind(condition = "Train",Train_Subjects,Train_Activty,Train_Features)

Test_Subjects<-read.table(data[26])
Test_Features<-read.table(data[27])
Test_Activty<-read.table(data[28])
Test_ActivityLables<- read.table(data[1])

DataSet <- rbind(DataSet,cbind(condition = "Test",Test_Subjects,Test_Activty,Test_Features))

#Appropriately labels the data set with descriptive variable names. 

FeatureNames <- read.table(data[2])
colnames(DataSet) <- c("Condition","Subjects","Activity",as.character(FeatureNames[,2]))

#Extracts only the measurements on the mean and standard deviation for each measurement. 

MeanCol = grep("mean",colnames(DataSet)) 
FreqCol = grep("Freq", colnames(DataSet))
StdCol = grep("std",colnames(DataSet))

DataSet2 = cbind(DataSet[,c(1,2,3)],DataSet[,c(MeanCol[!MeanCol %in% FreqCol])],
                 DataSet[,c(StdCol)])

#Uses descriptive activity names to name the activities in the data set

DataSet2$Activity <- factor(DataSet2$Activity,levels(factor(DataSet2$Activity)),
                            labels = Test_ActivityLables[,2])

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

DataSet3 = aggregate(DataSet2[,4:ncol(DataSet2)],
          list(Subject = DataSet2$Subject, Activity = DataSet2$Activity),
          mean,na.action=na.pass, na.rm=TRUE)
write.table(DataSet3,row.names = F,file = "Tidy Data Set.txt")
