# Data Dictionary for tidy_data.txt

## activity -  1
        Activity description
                WALKING
                WALKING_UPSTAIRS
                WALKING_DOWNSTAIRS
                SITTING
                STANDING
                LAYING
		
## subject - 1
        Subject id number
                1 - 30
	   
## features	   
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'x, y, z' at the end is used to denote 3-axial signals in the X, Y and Z directions.

Value provided is the mean of each feature grouped by activity and subject.
	   
        tbodyaccmeanx
        tbodyaccmeany
        tbodyaccmeanz
        tgravityaccmeanx
        tgravityaccmeany
        tgravityaccmeanz
        tbodyaccjerkmeanx
        tbodyaccjerkmeany
        tbodyaccjerkmeanz
        tbodygyromeanx
        tbodygyromeany
        tbodygyromeanz
        tbodygyrojerkmeanx
        tbodygyrojerkmeany
        tbodygyrojerkmeanz
        tbodyaccmagmean
        tgravityaccmagmean
        tbodyaccjerkmagmean
        tbodygyromagmean
        tbodygyrojerkmagmean
        fbodyaccmeanx
        fbodyaccmeany
        fbodyaccmeanz
        fbodyaccmeanfreqx
        fbodyaccmeanfreqy
        fbodyaccmeanfreqz
        fbodyaccjerkmeanx
        fbodyaccjerkmeany
        fbodyaccjerkmeanz
        fbodyaccjerkmeanfreqx
        fbodyaccjerkmeanfreqy
        fbodyaccjerkmeanfreqz
        fbodygyromeanx
        fbodygyromeany
        fbodygyromeanz
        fbodygyromeanfreqx
        fbodygyromeanfreqy
        fbodygyromeanfreqz
        fbodyaccmagmean
        fbodyaccmagmeanfreq
        fbodybodyaccjerkmagmean
        fbodybodyaccjerkmagmeanfreq
        fbodybodygyromagmean
        fbodybodygyromagmeanfreq
        fbodybodygyrojerkmagmean
        fbodybodygyrojerkmagmeanfreq
        angletbodyaccmeangravity
        angletbodyaccjerkmeangravitymean
        angletbodygyromeangravitymean
        angletbodygyrojerkmeangravitymean
        anglexgravitymean
        angleygravitymean
        anglezgravitymean
        tbodyaccstdx
        tbodyaccstdy
        tbodyaccstdz
        tgravityaccstdx
        tgravityaccstdy
        tgravityaccstdz
        tbodyaccjerkstdx
        tbodyaccjerkstdy
        tbodyaccjerkstdz
        tbodygyrostdx
        tbodygyrostdy
        tbodygyrostdz
        tbodygyrojerkstdx
        tbodygyrojerkstdy
        tbodygyrojerkstdz
        tbodyaccmagstd
        tgravityaccmagstd
        tbodyaccjerkmagstd
        tbodygyromagstd
        tbodygyrojerkmagstd
        fbodyaccstdx
        fbodyaccstdy
        fbodyaccstdz
        fbodyaccjerkstdx
        fbodyaccjerkstdy
        fbodyaccjerkstdz
        fbodygyrostdx
        fbodygyrostdy
        fbodygyrostdz
        fbodyaccmagstd
        fbodybodyaccjerkmagstd
        fbodybodygyromagstd
        fbodybodygyrojerkmagstd
