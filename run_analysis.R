# load library

library(dplyr)

# Set working directory

setwd("~/R/UCI HAR Dataset")

# Read training data

x_train <- read.table("./train/X_train.txt", header = FALSE)  # Features
y_train <- read.table("./train/y_train.txt", header = FALSE)  # Activity mapping
sub_train <- read.table("./train/subject_train.txt", header = FALSE)


# Read test data

x_test <- read.table("./test/X_test.txt", header = FALSE)   # Features
y_test <- read.table("./test/y_test.txt", header = FALSE)   # Activity mapping
sub_test <- read.table("./test/subject_test.txt", header = FALSE)

# Read supporting metadata

features <- read.table("features.txt", header = FALSE)
activity_labels <- read.table("activity_labels.txt", header = FALSE)


# Merge datasets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
sub <- rbind(sub_train, sub_test)


# Extract measurements - mean and standard deviation for each measurement ONLY
# From 561 variables we're only interested in 79

selected_features <- features[grep("mean|std",features[,2]),]
X <- X[,selected_features[,1]]

# Appropriately label the data set with descriptive variable names
# Use metadata loaded earlier as column headers

colnames(X) <- features[selected_features[,1],2]
colnames(Y) <- "activity"
colnames(sub) <- "subject"

# Merge these datasets

merged <- cbind(X, Y, sub)

# Use descriptive activity names to name the activities in the data set (using metadata)
# Turns into Factors

merged$activity <- factor(merged$activity, 
                          levels = activity_labels[,1], 
                          labels = activity_labels[,2])

merged$subject <- as.factor(merged$subject)


# From this dataset, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

tidy <- merged %>% 
        group_by(activity,subject) %>%
        summarise_all(mean)

# Create new file containing tidy dataset

write.table(tidy, file = "./tidydata.txt", col.names = TRUE, row.names = FALSE)




