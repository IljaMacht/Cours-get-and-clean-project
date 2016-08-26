setwd("D:/Docu/Coursera/Data Science Spec/3_Getting and Cleaning Data/project/UCI HAR Dataset")

# load train data set with subjects and activities
setwd("train")
X_train <- read.table("X_train.txt")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
setwd("..")

# load test data set with subjects and activities
setwd("test")
X_test <- read.table("X_test.txt")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
setwd("..")

# load activity labels and descriptive feature names
act_labels <- read.table("activity_labels.txt")
feat <- read.table("features.txt")

# merge training and test datasets, activities and subjects to one set each
X_all <- rbind(X_train,X_test)
y_all <- rbind(y_train,y_test)
subject_all <- rbind(subject_train,subject_test)

# give columns in feature data set decriptive names
colnames(feat) <- c("feat_number","feature")

# extract only the measurements on the mean and standard deviation for each measurement
featMeanStd <- feat[grep("mean|std", feat$feature),]
rightFeats <- featMeanStd$feat_number
X_MeanStd <- X_all[,rightFeats]

# create a vector with activities for each data row, use descriptive labels for it
act_vect <- character(length(y_all[[1]]))
for (i in seq_along(act_vect))
  act_vect[i] <- as.character(act_labels[y_all[i,],2])

# merge dataset, activities and subject to one dataset
X_MeanStd[80] <- act_vect
X_MeanStd[81] <- subject_all

# use descriptive activity names to name the activities in the data set
colnames(X_MeanStd) <- featMeanStd$feature
colnames(X_MeanStd)[80] <- "Activity"
colnames(X_MeanStd)[81] <- "Subject"

# create a second, independent tidy data set with the average of each variable
# for each activity and each subject. Remove the obsolete columns at the end
tidyData <-aggregate(X_MeanStd, by=list(Activity=X_MeanStd$Activity,Subject=X_MeanStd$Subject), FUN=mean)
tidyData[82:83] <- list(NULL)

#and write the new data set to a file in the end
write.table(tidyData, file="tidyData.txt", row.name=FALSE) 