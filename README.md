# Getting-and-Cleaning-Data
Coursera assignment week 4
==================================================================
Henri Chazelle
https://github.com/hchazelle/Getting-and-Cleaning-Data
Version of R:
platform       i386-w64-mingw32            
arch           i386                        
os             mingw32                     
system         i386, mingw32               
status                                     
major          3                           
minor          5.0                         
year           2018                        
month          04                          
day            23                          
svn rev        74626                       
language       R                           
version.string R version 3.5.0 (2018-04-23)
nickname       Joy in Playing

Operations performed on the original dataset
==================================================================

1.From the original experiment and dataset, we have merged the following files to obtain 1 global dataset:
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Training subjects.
- 'test/subject_test.txt': Test subjects.

2.We have then renamed the variables with descriptive ones using the "features.txt" file

3.We have then replaced the values of the variables activity with their descriptive ones with the help of the file "activity_labels.txt"

4.We have then subsetted this dataset to keep only the variables concerning the subjects, activities, mean and standard deviation.
The remaining 81 variables can be seen in the file "Code book.txt"

5.Finally, we have grouped all the observations by activity and subject calculating the average of these groups for all the variables.

6. The resulting dataframe has been saved in the text file "myTidyData.txt"

We have obtained 180 possible combinations of activities and subjects, and for each of them is provided:
======================================

- The subject
- The activity
- The average for each other 79 variables

The new github repository includes the following files:
=========================================

- 'Readme.md'

- 'Code book.txt': Shows information about the variables

- 'run_analysis.R': Script that has been used to create the new Tidy Data

- 'myTidyData.txt': Text file in chich the new dataset has been stored



