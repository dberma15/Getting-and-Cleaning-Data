# Getting-and-Cleaning-Data
This respository is dedicated to all material relevant to the course project for the Coursera course Getting and Cleaning Data. This document describes the files in this repository
##Run_Analysis
This code only requires the user only specify the directory of the files or where the files should be saved to. It will check if there is such a directory. If not, it will create one and download the zip file. If the working directory exists, it will download the zip file to that directory. Once downloaded, it will unzip the file, not overwriting any already existing files. 

From there, the code is automated and proceeds combine the test and trianing data sets, select only the variables pertaining to the mean and standard deviation of a measured quantity, and finding the mean for each subject for each acitivity type. This data is saved to a txt file meansOfMeasuresBySubjAndActivity.txt
