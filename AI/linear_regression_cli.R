#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 3) {
  cat(
    "Usage: Rscript linear_regression_cli.R <csv_file> <predictor> <outcome>\n",
    file = stderr()
  )
  quit(status = 1)
}

csv_file <- args[1]
predictor <- args[2]
outcome <- args[3]

if (!file.exists(csv_file)) {
  cat(
    sprintf("Error: CSV file not found in working directory: %s\n", csv_file),
    file = stderr()
  )
  quit(status = 1)
}

suppressPackageStartupMessages(library(ggplot2))

data <- read.csv(csv_file)

for (column in c(predictor, outcome)) {
  if (!column %in% names(data)) {
    cat(
      sprintf("Error: column '%s' not found in %s\n", column, csv_file),
      file = stderr()
    )
    quit(status = 1)
  }
}

formula <- as.formula(paste(outcome, "~", predictor))
model <- lm(formula, data = data)

model_summary <- summary(model)
r_squared <- model_summary$r.squared
p_values <- coef(model_summary)[, "Pr(>|t|)"]

cat(sprintf("R-squared: %.4f\n", r_squared))
cat(sprintf("p-value (Intercept): %.4e\n", p_values["(Intercept)"]))
cat(sprintf("p-value (%s): %.4e\n", predictor, p_values[predictor]))

intercept <- coef(model)["(Intercept)"]
slope <- coef(model)[[predictor]]
formula_text <- sprintf("y = %.2fx + %.2f", slope, intercept)
r2_text <- sprintf("R² = %.4f", r_squared)
annotation_text <- paste(formula_text, r2_text, sep = "\n")

plot_obj <- ggplot(data, aes(x = .data[[predictor]], y = .data[[outcome]])) +
  geom_point(color = "steelblue") +
  geom_line(aes(y = predict(model)), color = "darkred", linewidth = 1) +
  annotate(
    "text",
    x = -Inf,
    y = Inf,
    label = annotation_text,
    hjust = -0.02,
    vjust = 1.1,
    size = 3.5
  ) +
  labs(
    title = paste("Linear Regression of", outcome, "on", predictor),
    x = predictor,
    y = outcome
  ) +
  theme_minimal()

ggsave("regression_plot_R.png", plot = plot_obj, width = 8, height = 5, dpi = 150)
cat("Plot saved to regression_plot_R.png\n")
print(plot_obj)
