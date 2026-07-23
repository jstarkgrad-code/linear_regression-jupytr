README.md



**Assignment 3** - enhancements to the linear regression plot made in assignment 2. Includes 2 Jupyter notebooks, 2 HTML files, a python script, an R script, 2 output png files, an environment.yml, and a setup file. 



**This commit includes the following changes:** 

* slope-intercept equation, R^2, and mean squared error will now appear on the graph produced by the output



**Repo structure**

* "AI" folder contains files created by the AI agent (Cursor Plus) 
* "manual" folder contains files created by hand by me
* each folder has its own environment and setup file 



**Requirements and environment**

* run the setup\_env.sh file and it will use dependencies listed in the environment.yml to create a kernel to run jupyter notebooks and scripts
* The jupyter notebooks and HTML files have the CSV file hardcoded into them. The python and R scripts require user input of CSV file name, x value, and y value (see "How to run" below)



**How to run (command, inputs)**

* environment and setup: 

  1. chmod -x setup\_env.sh
  2. bash setup\_env.sh
  3. click the link to open jupyter notebooks. In the correct working directory, all files should appear to open and run in jupyter terminal
* **Running python script**

  1. python linear\_regression\_python.py CSV\_file\_name.csv x\_value\_title y\_value\_title

     * *example*: python linear\_regression\_python.py regression\_data.csv YearsExperience Salary
* **Running R script**

  1. Rscript linear\_regression\_r.R CSV\_file\_name.csv x\_value\_title y\_value\_title

     * *example*: Rscript linear\_regression\_r.R regression\_data.csv YearsExperience Salary



**Expected outputs and figure explanation**

* popups should be generated of the linear regression figure and png file should be exported to the working directory
* Certain hardware may cause on-screen display to fail. In this case, the figure is exported to the working directory as a pdf file. 



**Version tags**

* "Assignment2" tag contains the commit history before enhancements were made.
* "Assignment3-final" tag contains the above information and the commit from the AI execution of the assignment



**Author and course information** 

* The repository was made by Josephine Stark for assignment 3 of the course BSGP-7030 at The Ohio State University, taught by Dr. Mike Freitas 



