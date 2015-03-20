#GCD Course Project
#Getting data.
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./Assignment/getdata_projectfiles_UCI HAR Dataset.zip")
setwd("./Assignment")
unzip("getdata_projectfiles_UCI HAR Dataset.zip")
list.files()
setwd("./UCI HAR Dataset")
list.files()
#Reading the files
features <- read.table("features.txt", colClasses = c("character"))
activitylabels<-read.table("activity_labels.txt",col.names = c("ID", "Activity"))
xtest <- read.table("test/x_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")
xtrain <- read.table("train/x_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")
#Merging  all training data with cbind
trainingdata<-cbind(cbind(xtrain, subjecttrain), ytrain)
#Merging all test data with cbind
testdata <- cbind(cbind(xtest, subjecttest), ytest)
#Merging test and training data with rbind
trainingtestdata<-rbind(trainingdata, testdata)
#Assigning labels
labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ID"))[,2]
names(trainingtestdata) <- labels
#Extracting only the measurements on the mean and standard deviation for each measurements
datameanstd <- trainingtestdata[,grepl("mean|std|Subject|ID", names(trainingtestdata))]
library(plyr)
datameanstd <- join(datameanstd, activitylabels, by = "ID", match = "first")
datameanstd <- datameanstd[,-1]
#Labelling  the data set with descriptive variable names
names(datameanstd) <- gsub('\\(|\\)',"",names(datameanstd), perl = TRUE)
names(datameanstd) <- make.names(names(datameanstd))
names(datameanstd) <- gsub('Acc',"Acceleration",names(datameanstd))
names(datameanstd) <- gsub('GyroJerk',"Angular Acceleration",names(datameanstd))
names(datameanstd) <- gsub('Gyro',"Angular Speed",names(datameanstd))
names(datameanstd) <- gsub('Mag',"Magnitude",names(datameanstd))
names(datameanstd) <- gsub('^t',"Time",names(datameanstd))
names(datameanstd) <- gsub('^f',"Frequency",names(datameanstd))
names(datameanstd) <- gsub('\\.mean',".Mean",names(datameanstd))
names(datameanstd) <- gsub('\\.std',".Standard Deviation",names(datameanstd))
#Creating  a second,independent tidy data set and ouput it
avgbyact<- ddply(datameanstd, c("Subject","Activity"), numcolwise(mean))
write.table(avgbyact, file = "avgbyact.txt", row.name=FALSE )
