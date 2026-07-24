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

plot_obj <- ggplot(data, aes(x = .data[[predictor]], y = .data[[outcome]])) +
  geom_point(color = "steelblue") +
  geom_line(aes(y = predict(model)), color = "darkred", linewidth = 1) +
  annotate(
    "text",
    x = -Inf,
    y = Inf,
    label = paste0(
      "y = ", round(coef(model)[2], 2), "x + ", round(coef(model)[1], 2),
      "\nR^2 = ", round(summary(model)$r.squared, 3),
      "\nMSE = ", round(mean(residuals(model)^2), 2)
    ),
    hjust = -0.05,
    vjust = 1.5
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
