# Cours-get-and-clean-project
Coursera_Getting_and_Cleaning_Data_Course_Project
## load train data set with subjects and activities
### this is done with simple read.table() commands
## load test data set with subjects and activities
### this is too
## load activity labels and descriptive feature names
### and this as well
## merge training and test datasets, activities and subjects to one set each
### this is also simple rbind() to set tables one under another
## give columns in feature data set decriptive names
### for easier use
## extract only the measurements on the mean and standard deviation for each measurement
### grep extracts only the names of variables with mean or std in it
## create a vector with activities for each data row, use descriptive labels for it
### for each number in activity vector look up this activity's name in act_labels
## merge dataset, activities and subject to one dataset
### this is done for easier use of aggregate()
## use descriptive activity names to name the activities in the data set
### simple, use colnames()
## create a second, independent tidy data set with the average of each variable
## for each activity and each subject. Remove the obsolete columns at the end
### aggregate() does it, using mean() as function, calculating mean value for each subject and each activity, grouping same ones together
### the last two columns were added before and are now, grouped, the first two ones, so remove the last
## and write the new data set to a file in the end
