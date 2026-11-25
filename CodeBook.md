# **Getting and Cleaning Data Course Project** 
## **Description**
Additional information about the data, variables, and transformations used for the course project.

### **Source Data**
Source data is taken from the **Human Activity Recognition database**.

Link: https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

### **Information about the data**
The database consists of <ins>30 volunteers</ins> between the ages of <ins>19-48 years old</ins>. Each person was recorded with a smartphone (Samsung Galaxy S II) worn on the waist, while performing <ins>six daily activities</ins> which was classified as:

* Walking

* Walking upstairs

* Walking downstairs

* Sitting 

* Standing

* Laying


#### Training and Testing set
The participants was divided into a training and testing set. 

**Training set**
Training data can be loaded from the following files:

* X_train.txt: Training set

* y_train.txt: Contains the training labels (activities coded as 1-6)

* subject_train.txt: Each row is an identifier for a study participant in the training set

**Testing set**
Testing data can be loaded from the following files:

* X_test.txt: Testing set

* y_test.txt: Contains the testing labels (activities coded as 1-6)

* subject_test.txt: Each row is an identifier for a study participant in the testing set

### **Information about the construction of variables**
More complete information about the construction of variables can be extracted from the **features_info.txt** file.

The variables are constructed from the signals obtained from the smartphone and statistic measurements:

**Signals obtained from the smartphone:**

* tBodyAcc-XYZ

* tGravityAcc-XYZ

* tBodyAccJerk-XYZ

* tBodyGyro-XYZ

* tBodyGyroJerk-XYZ

* tBodyAccMag

* tGravityAccMag

* tBodyAccJerkMag

* tBodyGyroMag

* tBodyGyroJerkMag

* fBodyAcc-XYZ

* fBodyAccJerk-XYZ

* fBodyGyro-XYZ

* fBodyAccMag

* fBodyAccJerkMag

* fBodyGyroMag

* fBodyGyroJerkMag


**Statistics measurements used:**

* mean(): Mean value

* std(): Standard deviation

* mad(): Median absolute deviation 

* max(): Largest value in array

* min(): Smallest value in array

* sma(): Signal magnitude area

* energy(): Energy measure. Sum of the squares divided by the number of values

* iqr(): Interquartile range 

* entropy(): Signal entropy

* arCoeff(): Autorregresion coefficients with Burg order equal to 4

* correlation(): correlation coefficient between two signals

* maxInds(): index of the frequency component with largest magnitude

* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

* skewness(): skewness of the frequency domain signal 

* kurtosis(): kurtosis of the frequency domain signal 

* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window

* angle(): Angle between to vectors

### **Full list of variables**
List of variables (n=561) can be found in the **features.txt** file.
