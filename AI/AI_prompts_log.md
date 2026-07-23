Hello! This was uploaded on 7/19, because before submitting assignment 3, I realized I never uploaded this part to assignment 2. Luckily, I saved all my prompting to use in the assignment 2 reflection so I still had them. 



**Original prompt:** 

&#x20; → Hello. Please do not do any work outside of this directory. You may edit, create, overwrite, and delete anything in the assignment2/AI directory ONLY. Ask for permission before moving outside of this directory. Here is the assignment: Create 2 Jupyter notebook files, one that uses R and one that uses Python, to read the CSV file regression\_data.csv in the AI folder and outputs a fitted linear regression model overlay. You may use the environmentl.yml and setup\_env.sh files, in the AI folder or, create your own environment file or overwrite the existing one. Create markdown cells in between each section that explains what each section does. If parameters and not set in the prompt, ask me do not assume or hallucinate parameters.   





**Clarifying prompt:** 

The agent asked some follow up questions before executing my request. Here was my response to the parameters it needed clarified: 



&#x20; → 1 yes, use Salary as the outcome and YearsExperience as the predictor. 2. yes those are good names 3. show the scatter plot and fitted regression line only. Also add a graph title and axis titles using the outcome and predictor names. Output the R^2 and p-values to the user, do not overlay onto the figure. 4. Also add a graph title and axis titles using the outcome and predictor names 5. Create an environment and setup file for reproducibility. You can create new, use the ones provided, or overwrite/make edits to the existing files ONLY in assignment2/AI   directory. Please ask me if there are any more parameters you require from me.     



**Part 2 prompt:**

&#x20;→ For part 2 of the assignment: create 2 executable scripts, one written in python and one written in R, that do the same things as the notebooks but make the script CLI - take three inputs from the user: CSV file name, predictor (x variable title), and outcome (y variable title). Ask if you need any parameters verified.  



Note that I also prompted AI to push to GitHub, but I did not save that prompt

**Prompting for addition of MSE**
→Hello. I have some updates that need to be made to the files in this directory. You may edit and make changes to anything in this directory ONLY. Do not go outside this directory. The first changes to be made are to the notebooks. Make a calculation for mean squared error and print the value on the graph output underneath the slope intercept and R^2. Please ask me for additional parameter clarifications, do not make assumptions. 

  → the next updates are to the CLI python and R scripts. If the scripts do not have any annotations on the graph, add them to the top left corner and include the slope intercept formula, the R^2 value, and the MSE. Also, moving forward, do not look outside of the directory AI - unless you are using outside functions like jupyter or libraries. Do not look in the "manual" directory. Finally, ask me for any parameters that need clarification.

→ please change the notebooks so they don't print anything to the console, just output the annotated graph. Once the update has been made, export them as HTMLs, overwriting the old drafts. Don't delete the notebooks. I will have to submit all notebooks and HTML and scripts. Please ask any clarifying parameters, do not make assumptions  


