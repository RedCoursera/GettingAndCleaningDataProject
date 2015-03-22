## Data and Study Design

The data used for this project is the Smartlab's Human Activity Recognition
Using Smartphones data set.  Complete information about the data set can be 
found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

From the data set's README.txt:

>The experiments have been carried out with a group of 30 volunteers within 
>an age bracket of 19-48 years. Each person performed six activities 
>(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
>wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
>accelerometer and gyroscope, we captured 3-axial linear acceleration and 
>3-axial angular velocity at a constant rate of 50Hz. The experiments have been 
>video-recorded to label the data manually. The obtained data set has been 
>randomly partitioned into two sets, where 70% of the volunteers was selected 
>for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed 
>by applying noise filters and then sampled in fixed-width sliding windows 
>of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration 
>signal, which has gravitational and body motion components, was separated 
>using a Butterworth low-pass filter into body acceleration and gravity. 
>The gravitational force is assumed to have only low frequency components, 
>therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
>a vector of features was obtained by calculating variables from the time 
>and frequency domain.

>For each record it is provided:  
>* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
>* Triaxial Angular velocity from the gyroscope.  
>* A 561-feature vector with time and frequency domain variables.  
>* Its activity label.  
>* An identifier of the subject who carried out the experiment.  

The choices made when preparing this data for analysis were based upon 
the project instructions, which are included in run_analysis.R.

The following data files were utilized in the course project:  
* features.txt: List of all data variables/measures  
* activity_labels.txt: Links the activity numbers with their activity name  
* X_train.txt and X_test.txt: Training and test data sets, which were combined  
* y_train.txt and y_test.txt: Training and test activities  
* subject_train.txt and subject_test.txt: Training and test subject identifiers  

The data set also contains in both train and test the following files, 
which were not utilized (descriptions from data set's README):  
* Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.  
* Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration.  
* Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.  


## Code book and Tidy Data Output

In addition to the data variables described above, the data source's 
features_info.txt also describes these additional data points:  

>Subsequently, the body linear acceleration and angular velocity were derived 
>in time to obtain Jerk signals. Also the magnitude of these three-dimensional 
>signals were calculated using the Euclidean norm.  
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
>producing [frequency measures relating to body acceleration, jerk, and gyroscope.]  
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

Measurements relating to mean and standard deviation were extracted and
the average for each variable was calculated and output in TidyData.txt 
for each activity and subject.  The data originally was labeled with 
"t" and "f" prefixes.  In preparing the tidy data output these were updated 
to "Time" and "Frequency" for better unit understanding.  Six of the frequency 
measures had "body" repeating twice, not following the data documentation; 
the duplicate word was removed.  Other label abbreviations were reasonable and 
maintained for consistency.
