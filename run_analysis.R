## Merges the training and the test sets to create one data set.

a <- read.table("UCI HAR Dataset/train/X_train.txt")
b <- read.table("UCI HAR Dataset/test/X_test.txt")
ab <- rbind(a, b)
c <- read.table("UCI HAR Dataset/train/subject_train.txt")
d <- read.table("UCI HAR Dataset/test/subject_test.txt")
cd <- rbind(c, d)
e <- read.table("UCI HAR Dataset/train/y_train.txt")
f <- read.table("UCI HAR Dataset/test/y_test.txt")
ef <- rbind(e, f)
data <- cbind(ab, cd, ef)

## Extracts only the measurements on the mean and standard deviation for
## each measurement.

g <- read.table("UCI HAR Dataset/features.txt")
meanstd <- grep("mean\\(\\)|std\\(\\)", g[, 2])
data <- data[, meanstd]

## Uses descriptive activity names to name the activities in the data set.

h <- read.table("UCI HAR Dataset/activity_labels.txt")
h[, 2] = tolower(h[, 2])
ef[, 1] <- h[ef[, 1], 2]
data <- cbind(cd, ef, data)

## Appropriately labels the data set with descriptive activity names. 

names(data)[1] <- c("Subject")
names(data)[2] <- c("Activity")
names(data)[3:68] <- as.character(g[meanstd, 2])

## Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.

library(data.table)
data <- data.table(data)
output <- data[, lapply(.SD, mean), by = "Subject,Activity"]
write.table(output, file = "output.txt", row.names = FALSE)