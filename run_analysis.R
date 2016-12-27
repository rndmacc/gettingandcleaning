# import data from test and train set
testX=read.table("test/X_test.txt")
testY=read.table("test/Y_test.txt")
testS=read.table("test/subject_test.txt")
trainX=read.table("train/X_train.txt")
trainY=read.table("train/Y_train.txt")
trainS=read.table("train/subject_train.txt")


# import feature and activity labels
features_all=read.table("features.txt")
activities=read.table("activity_labels.txt", stringsAsFactors = FALSE)

# merge datasets (step 1)
X_all=rbind(testX, trainX)
Y=rbind(testY, trainY)
S=rbind(testS, trainS)

# identify mean and std variables (not including meanfreq)
index_mean = grep("mean", features_all[[2]])
index_meanfreq = grep("meanFreq", features_all[[2]])
index_mean = setdiff(index_mean, index_meanfreq)
index_std = grep("std", features_all[[2]])

# create X and features with only mean und std variables (step 2)
X=X_all[,c(index_mean, index_std)]
features=features_all[c(index_mean, index_std),]

# label activities (step 3)
Y_label = Y
for (i in Y) {
  Y_label[i,1] = activities[Y[i,1], 2]
}

# label colums of X (step 4)
colnames(X)=features[[2]]

# average variables per activity and subject and append to new data frame avg_data (step 5)
avg_data = data.frame()
for (subject in 1:30) {
  for (activity in 1:6) {
    index_s = S == subject
    index_y = Y == activity
    index = index_s & index_y
    means=colMeans(X[index, ])
    new_row = c(subject, activities[activity, 2], activity, means)
    avg_data=rbind(avg_data, new_row, stringsAsFactors = FALSE)
  }
}
colnames(avg_data) = c('Subject', 'Activity', 'Activity_index', colnames(X))

# save new data set
write.table(avg_data, file = "tidydataset.txt", row.name=FALSE)