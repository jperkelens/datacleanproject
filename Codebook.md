The R script in this repository creates a tidy data set from the [human activity data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) provided  by the UCI Machine Learning Repository

The tidy data represents the averages of all mean and standard deviation measurements for the subjects and activities measured in the study.

#### Resulting data set

+ Subject - Represents the subject in the study
+ Activity - The activity detected (LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS)
+ Measurements: 
++ Measurement column names are composed of several parts
++ Measurement name - This represents the actual thing being measured
++ Measurement type - This represents what kind of measurement it is
+++ mean() - the type is the mean
+++ std() - the type is the standard deviation
++ Measurement axis - Along what planar axis was the measurement made



The construction of the data set requires the following from the original data set:

+ The measurements from the training and test sets
+ The activities from the training and test sets
+ The subject list from the training and test sets
+ The measurement names
+ The activity id to activity name mapping

#### Merging the raw data
The tidy data is first constructed by concatenating all the rows from the different training and test data sets (measurements, subjects, activities)

Once, that is built, descriptive names are added for the columns of each of the data sets. Doing this for the subjects, activity, and activity mapping is trivial.

To get descriptive column names for the measurements, the feature names set is used.

After that, the activity list, measurement list, and subject list are merged.

Finally, the activity map and combined data set are joined to obtain descriptive names for the activities.

#### Selecting and summarizing the data

In order to obtain only the mean and standard deviation measurements. We select those columns that have 'mean()' or 'std()' in their column names, along with the activity name and subject columns.

Using dplyr, the data is grouped by subject and activity and then each column is summarized using the mean function.


