##read table
setwd('F:/coursera/explore_data/UCI HAR Dataset')
train_x<-read.table('./train/X_train.txt')
test_x<-read.table('./test/X_test.txt')
train_y<-read.table('./train/y_train.txt')
test_y<-read.table('./test/y_test.txt')
train_subject<-read.table('./train/subject_train.txt')
test_subject<-read.table('./test/subject_test.txt')
activity_label<-read.table('activity_labels.txt')
var_label<-read.table('features.txt')

##Merges the training and the test sets to create one data set.
train<-cbind(train_x,train_y,train_subject)
test<-cbind(test_x,test_y,test_subject)
data<-rbind(train,test)

##Extracts only the measurements on the mean and standard deviation for each measurement.
a<-c(grep("mean\\(\\)",var_label[,2]),grep("std\\(\\)",var_label[,2]))
data<-data[,c(a,562,563)]

##Uses descriptive activity names to name the activities in the data set
data<-merge(data,activity_label,by.x='activity',by.y='V1')
data<-data[,-1]

##Appropriately labels the data set with descriptive variable names.
names(data)<-c(as.character(var_label[a,2]),'subject','activity')

##creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
data_melt<-melt(data,id=c('activity','subject'),measure.vars=names(data)[1:66])
data_cast<-dcast(data_melt,activity+subject~variable,mean)

write.table(data_cast,file='tidy_data.txt',row.name=F)
