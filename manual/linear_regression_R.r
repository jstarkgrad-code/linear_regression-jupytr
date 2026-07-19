# This script demonstrates a simple linear regression analysis using R. User inputs the script name, CSV file name (data written as x,y), x variable column name heading, then y variable column name. Outputs are a saved png file of linear regression and a popup of the linear regression. 

#create an error message to the user if user does not submit enough inputs for the function
args <- commandArgs(trailingOnly = TRUE)
if (length(args) !=3) {
    stop("Using Rscript linear_regression_r.R <filename> <x_column> <y_column>")
}

#Create variables for each input
filename <- args[1]
xcol <- args[2]
ycol <- args[3]

#create a variable (data) to read and store the contents of the filename of a csv file input by the user. Create a variable to be used as the formula from the user inputs - the outcome and predictor (y and x) for the model. Fits a linear model with lm() function using the formula. 

data <- read.csv(filename)
formula <- as.formula(paste(ycol, "~", xcol))
model <- lm(formula, data = data)

#use the ggplot2 functions to create a scatterplot, and use the model made with the linear regression to overlay a line of best fit. Create a title and axis labels using the user's inputs 
library(ggplot2)
plot <- ggplot(data, aes_string(x = xcol, y = ycol)) +
    geom_point(colour = 'red') +
    geom_smooth(method = "lm", colour = 'blue') +
    ggtitle(paste(ycol, 'vs', xcol)) +
    xlab(xcol) +
    ylab(ycol) +
    annotate(
        "text", 
        x = -Inf, y = Inf, 
        label = paste0(
            "y = ", round(coef(model)[2], 2), "x + ", round(coef(model)[1], 2), "\nR^2 = ", round(summary(model)$r.squared, 3)
            ),
        hjust = -0.05, vjust = 1.5
     )

#Save the generated plot as a png file, and show the user in a popup (may save the popup as a pdf if unable to display from hardware limitation) 
ggsave('linear_regression_r_output.png', plot)
print(plot)