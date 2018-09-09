
# Code Book: Getting and Cleaning Data - Week 4 Project

## Data

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Tidy_data.txt file 

<b>Factor variables</b> (Columns 1 and 2)

* 1     subject: levels: 1 2 3 4 5 6
* 2     activity: levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

<b>Numeric Variables</b> - representing the average of each variable for each activity and each subject (by column number)

3	    timeDomainBodyAccelerometerMeanX                             
4	    timeDomainBodyAccelerometerMeanY                           
5	    timeDomainBodyAccelerometerMeanZ                        
6	    timeDomainBodyAccelerometerStandardDeviationX              
7	    timeDomainBodyAccelerometerStandardDeviationY                
8	    timeDomainBodyAccelerometerStandardDeviationZ                 
9	    timeDomainGravityAccelerometerMeanX                         
10	  timeDomainGravityAccelerometerMeanY                   
11	  timeDomainGravityAccelerometerMeanZ                          
12	  timeDomainGravityAccelerometerStandardDeviationX             
13	  timeDomainGravityAccelerometerStandardDeviationY            
14	  timeDomainGravityAccelerometerStandardDeviationZ            
15	  timeDomainBodyAccelerometerJerkMeanX                     
16	  timeDomainBodyAccelerometerJerkMeanY                        
17	  timeDomainBodyAccelerometerJerkMeanZ                         
18	  timeDomainBodyAccelerometerJerkStandardDeviationX            
19	  timeDomainBodyAccelerometerJerkStandardDeviationY       
20	  timeDomainBodyAccelerometerJerkStandardDeviationZ          
21	  timeDomainBodyGyroscopeMeanX                               
22	  timeDomainBodyGyroscopeMeanY                              
23	  timeDomainBodyGyroscopeMeanZ                              
24	  timeDomainBodyGyroscopeStandardDeviationX                     
25	  timeDomainBodyGyroscopeStandardDeviationY                  
26	  timeDomainBodyGyroscopeStandardDeviationZ                  
27	  timeDomainBodyGyroscopeJerkMeanX                           
28	  timeDomainBodyGyroscopeJerkMeanY                         
29	  timeDomainBodyGyroscopeJerkMeanZ                         
30	  timeDomainBodyGyroscopeJerkStandardDeviationX                
31	  timeDomainBodyGyroscopeJerkStandardDeviationY             
32	  timeDomainBodyGyroscopeJerkStandardDeviationZ             
33	  timeDomainBodyAccelerometerMagnitudeMean                  
34	  timeDomainBodyAccelerometerMagnitudeStandardDeviation        
35	  timeDomainGravityAccelerometerMagnitudeMean               
36	  timeDomainGravityAccelerometerMagnitudeStandardDeviation  
37	  timeDomainBodyAccelerometerJerkMagnitudeMean             
38	  timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation   
39	  timeDomainBodyGyroscopeMagnitudeMean                        
40	  timeDomainBodyGyroscopeMagnitudeStandardDeviation          
41	  timeDomainBodyGyroscopeJerkMagnitudeMean               
42	  timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation        
43	  frequencyDomainBodyAccelerometerMeanX                   
44	  frequencyDomainBodyAccelerometerMeanY                  
45	  frequencyDomainBodyAccelerometerMeanZ                
46	  frequencyDomainBodyAccelerometerStandardDeviationX   
47	  frequencyDomainBodyAccelerometerStandardDeviationY       
48	  frequencyDomainBodyAccelerometerStandardDeviationZ           
49	  frequencyDomainBodyAccelerometerMeanFrequencyX         
50	  frequencyDomainBodyAccelerometerMeanFrequencyY      
51	  frequencyDomainBodyAccelerometerMeanFrequencyZ              
52	  frequencyDomainBodyAccelerometerJerkMeanX          
53	  frequencyDomainBodyAccelerometerJerkMeanY                 
54	  frequencyDomainBodyAccelerometerJerkMeanZ                 
55	  frequencyDomainBodyAccelerometerJerkStandardDeviationX      
56	  frequencyDomainBodyAccelerometerJerkStandardDeviationY      
57	  frequencyDomainBodyAccelerometerJerkStandardDeviationZ        
58	  frequencyDomainBodyAccelerometerJerkMeanFrequencyX        
59	  frequencyDomainBodyAccelerometerJerkMeanFrequencyY       
60	  frequencyDomainBodyAccelerometerJerkMeanFrequencyZ            
61	  frequencyDomainBodyGyroscopeMeanX                            
62	  frequencyDomainBodyGyroscopeMeanY                             
63	  frequencyDomainBodyGyroscopeMeanZ                           
64	  frequencyDomainBodyGyroscopeStandardDeviationX               
65	  frequencyDomainBodyGyroscopeStandardDeviationY                
66	  frequencyDomainBodyGyroscopeStandardDeviationZ             
67	  frequencyDomainBodyGyroscopeMeanFrequencyX                  
68	  frequencyDomainBodyGyroscopeMeanFrequencyY                  
69	  frequencyDomainBodyGyroscopeMeanFrequencyZ                    
70	  frequencyDomainBodyAccelerometerMagnitudeMean            
71	  frequencyDomainBodyAccelerometerMagnitudeStandardDeviation 

72	  frequencyDomainBodyAccelerometerMagnitudeMeanFrequency      
73	  frequencyDomainBodyAccelerometerJerkMagnitudeMean            
74	  frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation

75	  frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency   
76	  frequencyDomainBodyGyroscopeMagnitudeMean                   
77	  frequencyDomainBodyGyroscopeMagnitudeStandardDeviation       
78	  frequencyDomainBodyGyroscopeMagnitudeMeanFrequency            
79	  frequencyDomainBodyGyroscopeJerkMagnitudeMean                
80	  frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation  
81	  frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency      


## Data Cleaning

The following files were loaded:

<b>Training sets:</b>
* X_train.txt
* Y_train.txt
* subject_train.txt
  
<b>Test sets:</b>
* X_test.txt
* Y_test.txt
* subject_test.txt

<b>Other files:</b>
* activity_labels.txt
* features.txt


The following <b>steps</b> were taken to clean the data:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



