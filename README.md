This note is more or less following the steps of the run_analysis code. Please review it along side the code itself foe clarity. Thank you
#Install required packages
This section of the code installs required packages to run the code and test that it is 

#download the zipped data file
specifies the URL to the data file and downloads it into local directory

#unzip the data file into "data" folder
Unzips the data into a local folder created with the last part of this function

#read  data
The fisrt part of the code reads the data used for training as well as the subjects.
the next section data used as test as well as the subjects. and the last two sections read the data 
features and activity labels of the data, respectively.

#merge the datasets
The next step was to merge the datasets. This was accomplished using rbind()

#extract the measurements on mean and StDev only
Using grep()function, only variables of interest (mean and StDev) was extracted 

#descriptive naming of activities in the dataset
Variables were assigned a more descriptives names.

#create new tidy dataset from the previous step
As the last step new dataet new dataset called "tidydata" was created using cbind() function.
Group by and summarize_all was used to summarize the mean. LAst but not least data was written into table named tidydata.
This data was saved under the same directory as the code in the folder "data". "tidydata" is then shared on github repo "tidydata"
together with the code.
