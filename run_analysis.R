setwd("D:/Docu/Coursera/Data Science Spec/3_Getting and Cleaning Data/project/UCI HAR Dataset/train")
X_train <- read.table("X_train.txt")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")

setwd("D:/Docu/Coursera/Data Science Spec/3_Getting and Cleaning Data/project/UCI HAR Dataset/test")
X_test <- read.table("X_test.txt")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")

X_all <- rbind(X_train,X_test)
y_all <- rbind(y_train,y_test)
subject_all <- rbind(subject_train,subject_test)

setwd("D:/Docu/Coursera/Data Science Spec/3_Getting and Cleaning Data/project/UCI HAR Dataset")
act_labels <- read.table("activity_labels.txt")
feat <- read.table("features.txt")

colnames(feat) <- c("feat_number","feature")

featMeanStd <- feat[grep("mean|std", feat$feature),]
rightFeats <- featMeanStd$feat_number
X_MeanStd <- X_all[,rightFeats]

act_vect <- character(length(y_all[[1]]))
for (i in seq_along(act_vect))
  act_vect[i] <- as.character(act_labels[y_all[i,],2])
X_MeanStd[80] <- act_vect
X_MeanStd[81] <- subject_all


colnames(X_MeanStd) <- featMeanStd$feature
colnames(X_MeanStd)[80] <- "Activity"
colnames(X_MeanStd)[81] <- "Subject"

tidyData <-aggregate(X_MeanStd, by=list(Activity=X_MeanStd$Activity,Subject=X_MeanStd$Subject), FUN=mean)
tidyData[82:83] <- list(NULL)

activData <-aggregate(X_MeanStd, by=list(Activity=X_MeanStd$Activity), FUN=mean)