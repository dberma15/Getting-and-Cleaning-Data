  # if (!file.exists("C:\\Users\\daniel\\Documents\\R\\Getting and Cleaning Data")){
  #   dir.create('C:\\Users\\daniel\\Documents\\R\\Getting and Cleaning Data')
  # }
  # 
  # workingdirectory<-"C:\\Users\\daniel\\Documents\\R\\Getting and Cleaning Data"
  
#Load the data 
  if (!file.exists("C:\\Users\\bermads1\\Documents\\Daniel\\Coursera\\Getting and Cleaning Data")){
    dir.create('C:\\Users\\bermads1\\Documents\\Daniel\\Coursera\\Getting and Cleaning Data')
  }
  
  #the upper level of the working directory
  workingdirectory<-"C:\\Users\\bermads1\\Documents\\Daniel\\Coursera\\Getting and Cleaning Data"
  
  #Sets the working directory and checks that the zip file is downloaded. If the file is not downloaded then it
  #downloads it
  setwd(workingdirectory)
  fileurl='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  if (!any(grepl('datafile_exercise.zip',list.files(path='.')))){
    download.file(fileurl, destfile="..\\Getting and Cleaning Data\\datafile_exercise.zip")
  }
  filenames<-unzip("datafile_exercise.zip",overwrite=FALSE) #Unzips the file
  
  #Establishes a new working directory based on where the training data is located
  workingdirectoryNew<-paste(workingdirectory,'\\UCI HAR Dataset\\train', sep='')
  trainDataFiles<-list.files(workingdirectoryNew,pattern='\\.')#takes the file names in the working directory
  trainDataVariables<-sub('.txt','',trainDataFiles) #removes the .txt from those file names
  #loops through the file names, and stores the data in variables named after those files  Should include X_train, y_train, subject_train
  for (i in 1:length(trainDataVariables)){
    assign(trainDataVariables[i],read.table(paste(workingdirectoryNew,trainDataFiles[i], sep='\\')))
  }
  
  #Establishes a new working directory based on where the training data is located
  workingdirectoryNew<-paste(workingdirectory,'\\UCI HAR Dataset\\test', sep='')
  testDataFiles<-list.files(workingdirectoryNew,pattern='\\.')#takes the file names in the working directory
  testDataVariables<-sub('.txt','',testDataFiles) #removes the .txt from those file names
  #loops through the file names, and stores the data in variables named after those files. Should include X_test, y_test, subject_test
  for (i in 1:length(testDataVariables)){
    assign(testDataVariables[i],read.table(paste(workingdirectoryNew,testDataFiles[i], sep='\\')))
  }
  
  setwd(paste(workingdirectory,'\\UCI HAR Dataset',sep='')) #changes the working directory to one level down.
  features<-read.table('features.txt') #list of column names for X_train/test
  activity_labels<-read.table('activity_labels.txt') #maping of numbers in y_train/test to the activity name
  
#Merges the test and training data
  X_combined<-rbind(X_train,X_test)
  y_combined<-rbind(y_train,y_test)
  subjects_combined<-rbind(subject_train,subject_test)

#Extracts only the measurements on the mean and standard deviation for each measurement
  colnames(X_combined)<-features[,2]
  meanAndStd<-grep('mean\\(\\)|std\\(\\)', features[,2], ignore.case=TRUE)
  X_combined<-X_combined[,meanAndStd]
  names(X_combined)<-sub('\\(\\)','',names(X_combined))

#Uses descriptive activity names to name the activities in the data set
  colnames(y_combined)<-'activity label'
  y_combined<-as.character(y_combined[[1]])
  for (i in 1:dim(activity_labels)[1]){
    y_combined<-sub(activity_labels[i,1],tolower(activity_labels[i,2]),y_combined)
  }
  y_combined<-as.matrix(y_combined)

  #Appropriately labels the data set with descriptive variable names. 
  colnames(subjects_combined)<-'Subject ID'
  dataCombined<-cbind(subjects_combined,y_combined,X_combined)

#
  uniqueSubjects=unique(subjects_combined[,1])
  numberSubjects=length(uniqueSubjects)
  numberActivities<-dim(activity_labels)[1]
  numberDataColumns<-dim(dataCombined)[2]
  results=dataCombined[1:(numberSubjects*numberActivities),]
  row=1
  for (s in 1:numberSubjects){
    for (a in 1:numberActivities){
      results[row,1]=uniqueSubjects[s]
      results[row,2]=tolower(activity_labels[a,2])
      tmp<-dataCombined[(grepl(tolower(activity_labels[a,2]),dataCombined[,2]) & grepl(s,dataCombined[,2])),]
      results[row,3:numberDataColumns]<-colMeans(tmp[,3:numberDataColumns])
      row=row+1
    }
  }
  write.table(results,'meansOfMeasuresBySubjAndActivity.txt',row.name=FALSE)
  
