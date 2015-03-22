## Data Cleaning Project

The R script in this repository creates a tidy data set from the [human activity data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) provided  by the UCI Machine Learning Repository

The tidy data represents the averages of all mean and standard deviation measurements for the subjects and activities measured in the study.

The original data is split up into multiple files:

+ 'train/X_train.txt': Measurement for the training set.

+ 'train/y_train.txt': Activity ids for the training set.
++ Each row corresponds to the activity being performed when the measurements were recorded

+ 'test/X_test.txt': Measurement for the test set.

+ 'test/y_test.txt': Activity ids for the test set.
++ Each row corresponds to the activity being performed when the measurements were recorded

+ 'train/subject_train.txt': Subject ids for the training set
++ Each row corresponds to the subject performing the activity 

+ 'test/subject_train.txt': Subject ids for the test set.
++ Each row corresponds to the subject performing the activity 

+ 'features.txt': Ordered List of the measurements in the data sets

+ 'activity_labels.txt': Map of activity id to activity name
