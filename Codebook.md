## Codebook: Getting and Cleaning Data

### Import

- testX, trainX: Measured data from test and train data sets. Columns (features) are explained in features_info.txt in the original data
- testY, trainY: Numerical activity data from test and train data sets. Values from 1 to 6.
- testS, trainS: Numerical subject data from test and train data sets. Values from 1 to 30.
- features_all: Descriptions of the columns in testX and trainX.
- activities: Assigns descriptions to the numerical values in testY and trainY.

### Merge data sets
- X_all: Combines data from testX and trainX.
- Y: Combines data from testY and trainY.
- S: Combines data from testS and trainS.

### Extract relevant variables
- index_mean: Indices of columns in X_all which contain mean variables.
- index_std: Indices of columns in X_all which contain std variables.
- X: Data from X_all reduced to mean and std variables.
- features: Feature list from features_all reduced to mean and std variables.

### Labels
- Y_label: Activity labels from activies applied to Y.

### Average data set
- avg_data: New data set with average values per subject and activity
- index_s: Indices of columns in X which are assigned to a given subject.
- index_y: Indices of columns in X which are assigned to a given activity.
- index: Combination of index_s and index_y.
- means: Mean values of variables in X for given subject and activity.
- new_row: New row for avg_data with given subject and activity.