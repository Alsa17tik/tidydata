#Install required packages
install.packages("dplyr")
install.packages("reshape2")
library(dplyr)

#download the zipped data file
dataurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl,destfile = "./data/Dataset.zip")
#unzip the data file into "data" folder
unzip(zipfile = "./data/Dataset.zip",exdir="./data")

#read train data
X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")
Subj_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#read test data
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
Subj_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#read features/description
variable_names<-read.table("./data/UCI HAR Dataset/features.txt")
#read activity labels
activity_lables<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

#merge the two (training and test) datasets
X_total<-rbind(X_train,X_test)
Y_total<-rbind(Y_train,Y_test)
Subj_total<-rbind(Subj_train,Subj_test)

#extract the measurements on mean and StDev only
chosen_varibale<-variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total<-X_total[,chosen_varibale[,1]]

#descriptive naming of activities in the dataset
colnames(Y_total)<-"activity"
Y_total$activitylabel<-factor(Y_total$activity,labels = as.character(activity_lables[,2]))
activitylabel<-Y_total[,-1]

#Lable the dataset with descriptive variable names
colnames(X_total)<-variable_names[chosen_varibale[,1],2]

#create new tidy dataset from the previous step
colnames(Subj_total)<-"subject"
total<-cbind(X_total,activitylabel,Subj_total)
total_mean<-total %>% group_by(activitylabel,subject) %>% summarize_all(funs(mean))
write.table(total_mean,file="./data/UCI HAR Dataset/tidydata.txt",row.names = FALSE,col.names = TRUE)


