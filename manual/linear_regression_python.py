#!/usr/bin/env python
# coding: utf-8
# This script demonstrates a simple linear regression analysis using Python. User inputs the script name, CSV file name (data written as x,y), x variable column name heading, then y variable column name. Outputs are a saved png file of linear regression and a popup of the linear regression.   

#import module and libraries for function use and renames libraries to a short had version to be called later
import sys
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

#create an error message to the user if user does not submit enough inputs for the function
if len(sys.argv) !=4: 
    print("Usage: python linear_regression_python.py <filename> <x_column> <y_column>")
    sys.exit(1)

#assign variables for each input
filename = sys.argv[1]
x_col = sys.argv[2]
y_col = sys.argv[3]

#create a variable (data) to read and store the contents of the filename of a csv file input by the user. Call the linear regression function, assign to a variable named “model”. Use linear regression variable to assign x and y values from the table input by the user
data = pd.read_csv(filename)
model = LinearRegression()
model.fit(data[[x_col]], data[[y_col]])

#use the matplotlib functions to create a scatterplot, and use the model made with the linear regression to overlay a line of best fit. Create a title and axis labels using the user's inputs.   
plt.scatter(data[[x_col]], data[[y_col]], color="red")
plt.plot(data[[x_col]], model.predict(data[[x_col]]), color="blue")
plt.title(f'{y_col} vs {x_col}')
plt.xlabel(x_col)
plt.ylabel(y_col)

#save the generated plot as a png file, and show the user in a popup
plt.savefig("linear_regression_python_output.png")
plt.show()